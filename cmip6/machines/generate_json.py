"""
.. module:: generate_json.py
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Generates CMIP6 JSON documents from XLS files.

.. moduleauthor:: Sadie Bartholomew <sadie.bartholomew@ncas.ac.uk>

"""
import argparse
import collections
import json
import os

import openpyxl

from cmip6.utils import io_mgr
from cmip6.utils import logger
from cmip6.utils import vocabs


# Define command line argument parser.
_ARGS = argparse.ArgumentParser("Generates CMIP6 machine JSON files.")
_ARGS.add_argument(
    "--institution-id",
    help="An institution identifier",
    dest="institution_id",
    type=str
    )


def _main(args):
    """Main entry point.

    """
    for i in vocabs.get_institutes(args.institution_id):
        _write(i)


def _write(i):
    """Writes citation JSON file for a particular institute.

    """
    try:
        spreadsheet = _get_spreadsheet(i)
    except IOError:
        msg = '{} machines spreadsheet not found'.format(i.canonical_name)
        logger.log_warning(msg)
    else:
        content = _get_content(i, spreadsheet)
        if content:
            _write_content(i, content)


def _get_spreadsheet(i):
    """Returns a spreadsheet for processing.

    """
    path = io_mgr.get_machines_spreadsheet(i)
    if not os.path.exists(path):
        raise IOError()

    return openpyxl.load_workbook(path, read_only=True)


def _get_content(i, spreadsheet):
    """Returns content to be written to file system.

    """
    # Initialise output.
    obj = collections.OrderedDict()

    # TODO : process machine spreadsheet content here
    return obj


def _write_content(i, content):
    """Writes json content to file system.

    """
    fpath = io_mgr.get_machines_json(i)
    with open(fpath, 'w') as fstream:
        fstream.write(json.dumps(content, indent=4))


def _set_xls_content(obj, worksheet):
    """Sets content for a particular specialization.

    """
    # TODO : process machine spreadsheet content here
    pass


# Main entry point.
if __name__ == '__main__':
    _main(_ARGS.parse_args())
