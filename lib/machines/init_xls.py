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

from openpyxl import load_workbook

from lib.utils import (io_mgr, logger, vocabs, constants)


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


def set_institute_name_in_xls(institution, spreadsheet):
    """Set the institute name on the frontis and machine tab header."""
    institution_name = institution.canonical_name.upper().encode()  # e.g. AER

    # Write institute name on frontis page.
    frontis_sheet = spreadsheet["Frontis"]
    print(frontis_sheet)
    frontis_sheet["B4"] = institution_name

    # Write header including institute name on the machine tab.
    machines_sheet = spreadsheet["Machine 1"]
    machines_sheet["B1"] = "{} Machine for {}".format(
        institution_name, constants.CMIP6_MIP_ERA.upper())


def set_applicable_models_in_xls(institution, spreadsheet):
    pass


def set_applicable_experiments_in_xls(institution, spreadsheet):
    pass


def _main(args):
    """Main entry point.

    """
    # Defensive programming.
    if not os.path.exists(args.xls_template):
        raise ValueError("XLS template file does not exist")

    # Take generic machine spreadsheet template as Workbook ready to customise.
    template_name = args.xls_template
    generic_template = load_workbook(filename=template_name)

    # Write out a customised template file for every institute.
    for institution in vocabs.get_institutes(args.institution_id):
        # Customise the template appropriately to the given institute:
        #     1. Set the institute name
        set_institute_name_in_xls(institution, generic_template)

        #     2. Set the applicable CMIP6 models for this institute
        set_applicable_models_in_xls(institution, generic_template)

        #     3. Set the applicable CMIP6 experiments for this institute
        set_applicable_experiments_in_xls(institution, generic_template)

        # Write out the customised template to a new XLS file.
        final_spreadsheet_name = "{}_{}_machines.xlsx".format(
            constants.CMIP6_MIP_ERA, institution.canonical_name)
        generic_template.save(final_spreadsheet_name)

        # Place the template into the appropriate directory.
        dest = io_mgr.get_machines_spreadsheet(i)
        if not os.path.exists(dest):
            logger.log("moving xls file for {}".format(i.raw_name))
            shutil.copy(customised_template, dest)


# Main entry point.
if __name__ == '__main__':
    _main(_ARGS.parse_args())
