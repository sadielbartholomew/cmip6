"""
.. module:: generate_pdf.py
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Generates CMIP6 model documentation PDF documents.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.jussieu.fr>

"""
import argparse
import datetime as dt
import os

import latex
from tornado import template

from cmip6.models.utils import ModelTopicOutput
from cmip6.utils import io_mgr
from cmip6.utils import vocabs


# Define command line argument parser.
_ARGS = argparse.ArgumentParser("Generates CMIP6 model PDF files.")
_ARGS.add_argument(
    "--institution-id",
    help="An institution identifier",
    dest="institution_id",
    type=str
    )

# MIP era.
_MIP_ERA = "cmip6"

# Template cache.
_TEMPLATES_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "templates_pdf")
_TEMPLATES = template.Loader(_TEMPLATES_PATH)


def _main(args):
    """Main entry point.

    """
    # Load latex template.
    template = _TEMPLATES.load("main.tornado")

    # Write PDF files.
    for i, s, t in vocabs.yield_topics(args.institution_id):
        try:
            _write(template, i, s, t)
        except Exception as err:
            fname = '{}_{}_{}_{}.pdf'.format(
                _MIP_ERA, i.canonical_name, s.canonical_name, t.canonical_name
                )
            print('ERROR --> {}'.format(fname))
            continue


def _write(template, i, s, t):
    """Main entry point.

    """
    # Set documentation wrapper.
    doc = ModelTopicOutput.create(i, s, t)

    # Set identifiers used for indentation purposes.
    _set_identifiers(doc.specialization)

    # Generate latex.
    as_latex = template.generate(
        topic=doc.specialization,
        topic_label=t.label,
        DOC=doc,
        now=dt.datetime.now(),
        _str=_str
        )

    # Ensure that PDf generation will process unicode characters.
    as_latex = as_latex.replace('&amp;', 'and')
    as_latex = as_latex.replace('&quot;', '"')

    # Generate PDF.
    as_pdf = latex.build_pdf(as_latex)

    # Write pdf.
    io_mgr.write_model_topic_pdf(i, s, t, as_pdf)


def _set_identifiers(t):
    """Initialises property & property set identifiers.

    """
    idx1 = 0
    for pc in t.all_property_containers:
        level = len(pc.id.split('.'))
        if level == 3:
            idx1 += 1
            idx2 = 1
            idx3 = 1
        elif level == 4:
            idx2 += 1
            idx3 = 1
        elif level == 5:
            idx3 += 1
        pc.idx = '{}.{}.{}'.format(idx1, idx2, idx3)
        for idx, p in enumerate(pc.properties):
            p.idx = '{}.{}'.format(pc.idx, idx + 1)


def _str(val):
    """Formats a string value.

    """
    if val is None:
        return ''
    elif not isinstance(val, (str, unicode)):
        return str(val)
    else:
        val = val.encode('utf').strip()
        if len(val) == 0:
            return ''

        val = '{}{}'.format(val[0].upper(), val[1:])

        # Ensures latex can emit.
        val = unicode(val, "utf-8", errors="ignore")
        val = val.encode('ascii', 'ignore')

    return val


# Main entry point.
if __name__ == '__main__':
    _main(_ARGS.parse_args())
