"""
.. module:: init_machines_xls.py
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Initialises CMIP6 machines spreadsheets.

.. moduleauthor::
   Mark Conway-Greenslade <momipsl@ipsl.jussieu.fr>
   Sadie Bartholomew <sadie.bartholomew@ncas.ac.uk>

"""
import argparse
import os
import shutil

from lib.utils import io_mgr
from lib.utils import logger
from lib.utils import vocabs



# Define command line argument parser.
_ARGS = argparse.ArgumentParser("Initialises CMIP6 machines spreadsheets.")
_ARGS.add_argument(
    "--institution-id",
    help="An institution identifier",
    dest="institution_id",
    type=str,
    default="all"
    )
_ARGS.add_argument(
    "--xls-template",
    help="Path to XLS template",
    dest="xls_template",
    type=str
    )


def _main(args):
    """Main entry point.

    """
    # Defensive programming.
    if not os.path.exists(args.xls_template):
        raise ValueError("XLS template file does not exist")

    # Write one file per institute.
    for i in vocabs.get_institutes(args.institution_id):
        dest = io_mgr.get_machines_spreadsheet(i)
        if not os.path.exists(dest):
            logger.log("copying xls file for {}".format(i.raw_name))
            shutil.copy(args.xls_template, dest)


# Main entry point.
if __name__ == '__main__':
    _main(_ARGS.parse_args())
