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


def set_institute_name_in_xls(institution):
    pass


def set_applicable_models_in_xls(institution):
    pass


def set_applicable_experiments_in_xls(institution):
    pass


def _main(args):
    """Main entry point.

    """
    # Defensive programming.
    if not os.path.exists(args.xls_template):
        raise ValueError("XLS template file does not exist")

    # Take generic machine spreadsheet template ready to customise.
    generic_template = args.xls_template

    # Write out a customised template file for every institute.
    for i in vocabs.get_institutes(args.institution_id):
        # Customise the template appropriately to the given institute:
        #     1. Set the institute name
        ### TODO, use set_institute_name_in_xls()
        #     2. Set the applicable CMIP6 models for this institute
        ### TODO, use set_applicable_models_in_xls()
        #     3. Set the applicable CMIP6 experiments for this institute
        ### TODO, use set_applicable_experiments_in_xls()

        # Write out the customised template to a new XLS file.
        ### TODO

        # Place the template into the appropriate directory.
        dest = io_mgr.get_machines_spreadsheet(i)
        if not os.path.exists(dest):
            logger.log("moving xls file for {}".format(i.raw_name))
            shutil.copy(customised_template, dest)


# Main entry point.
if __name__ == '__main__':
    _main(_ARGS.parse_args())
