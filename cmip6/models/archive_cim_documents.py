"""
.. module:: archive_cim_documents.py
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Moves generated CMIP6 model CIM documets into archive.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.jussieu.fr>

"""
import argparse
import hashlib
import os
import shutil

from cmip6.utils import vocabs
from cmip6.utils import io_mgr


# Define command line argument parser.
_ARGS = argparse.ArgumentParser("Synchronizes CMIP6 model CIM files between institutional repos & main archive.")
_ARGS.add_argument(
    "--institution-id",
    help="An institution identifier",
    dest="institution_id",
    type=str,
    default="all"
    )
_ARGS.add_argument(
    "--destination",
    help="Folder to which CIM documents will be copied.",
    dest="dest",
    type=str
    )

# MIP era.
_MIP_ERA = "cmip6"


def _main(args):
    """Main entry point.

    """
    if not os.path.exists(args.dest):
        raise ValueError("Destination folder is invalid")

    for i, s, in vocabs.yield_sources(args.institution_id):
        _copy_files(i, s)


def _copy_files(institute, source_id):
    """Copies model files into archive.

    """
    for src in _get_cim_files(institute, source_id):
        fname = hashlib.md5(src.split("/")[-1]).hexdigest()
        dest = os.path.join(args.dest, '{}.json'.format(fname))
        shutil.copy(src, dest)


def _get_cim_files(institute, source_id):
    """Returns CIM files to be copied to documentation archive.

    """
    folder = io_mgr.get_model_folder(institute, source_id, 'cim')

    return [os.path.join(folder, i) for i in os.listdir(folder)]


# Main entry point.
if __name__ == '__main__':
    _main(_ARGS.parse_args())
