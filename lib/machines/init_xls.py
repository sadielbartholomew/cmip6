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

from copy import copy

from openpyxl import load_workbook
from openpyxl.styles import NamedStyle, Font, PatternFill
from openpyxl.worksheet.datavalidation import DataValidation

from lib.utils import io_mgr, logger, vocabs, constants


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


# Define formatting styles to apply on the generated spreadsheets.
QUESTION_HEADER_STYLE = NamedStyle(name="QUESTION_HEADER_STYLE")
QUESTION_HEADER_STYLE.fill = PatternFill(start_color="337AB7")
QUESTION_HEADER_STYLE.font = Font(
    name="Helvetica Neue", size=14, bold=True, color="FFFFFF")
QUESTION_INPUT_BOX_STYLE = NamedStyle(name="QUESTION_INPUT_BOX_STYLE")
QUESTION_INPUT_BOX_STYLE.fill = PatternFill(start_color="CCCCCC")
QUESTION_INPUT_BOX_STYLE.font = Font(
    name="Helvetica Neue", size=14, bold=False, color="000000")


def copy_cell(sheet, cell_to_copy_to, cell_to_copy_from):
    """Apply the value and background style of a cell to another named cell."""
    sheet[cell_to_copy_to] = sheet[cell_to_copy_from].value
    sheet[cell_to_copy_to]._style = copy(sheet[cell_to_copy_from]._style)


def set_institute_name_in_xls(institution, spreadsheet):
    """Set the institute name on the frontis and machine tab header."""
    institution_name = institution.canonical_name.upper().encode()  # e.g. AER

    # Write institute name on frontis page.
    frontis_sheet = spreadsheet["Frontis"]
    frontis_sheet["B4"] = institution_name

    # Write header including institute name on the machine tab.
    machines_sheet = spreadsheet["Machine 1"]
    machines_sheet["B1"] = "{} Machine for {}".format(
        institution_name, constants.CMIP6_MIP_ERA.upper())


def set_applicable_models_in_xls(institution, spreadsheet):
    """Create a question concerning every CMIP6 model ran by the institute."""
    machines_sheet = spreadsheet["Machine 1"]

    active_row = 390  # last row where model question cell block needs updating
    label_base = "1.8.2.{}"
    section_number = 1  # ready to increment label_base end sectioning from one

    for model in vocabs.get_model_configurations(institution):
        if section_number != 1:
            # Create new block of three rows: two question rows plus one gap
            machines_sheet.insert_rows(active_row + 1, 3)
            for row_number in range(active_row - 2, 3):
                machines_sheet.row_dimensions[row_number].height = 40

            active_row += 3  # move active row down to top-most block to update

            # Merge columns on the B-D for the question block. Note that for
            # merged cells, reference only needs to be to the top left cell.
            for coor in (active_row, active_row + 1):
                machines_sheet.merge_cells("B{0}:D{0}".format(coor))

            # Style cells first, as this avoids style issues with re-assignment
            for col in ("A", "B"):
                machines_sheet[
                    "{}{}".format(col, active_row - 1)
                ].style = QUESTION_HEADER_STYLE
            machines_sheet[
                "A{0}".format(active_row)
            ].style = QUESTION_INPUT_BOX_STYLE

            # Take four cells as the basic block with the question for a model.
            # Set the newly inserted rows to be identical to the basic block.
            # (Note 'for col in ("A", "B"):' use to prevent duplication breaks
            # the formatting for unknown reasons, so will have to leave as-is!)
            copy_cell(
                machines_sheet,
                "A{}".format(active_row),
                "A{}".format(active_row - 3)
            )
            copy_cell(
                machines_sheet,
                "A{}".format(active_row - 1),
                "A{}".format(active_row - 4)
            )
            copy_cell(
                machines_sheet,
                "B{}".format(active_row),
                "B{}".format(active_row - 3)
            )
            copy_cell(
                machines_sheet,
                "B{}".format(active_row - 1),
                "B{}".format(active_row - 4)
            )

            # Finally, add a 'YES/NO' drop-down box (i.e. some data validation)
            yes_or_no_dropdown = DataValidation(
                type="list", formula1='"YES,NO"', allow_blank=False)
            machines_sheet.add_data_validation(yes_or_no_dropdown)
            yes_or_no_dropdown.add("B{}".format(active_row))

        # Change label cell so final (sub-sub-sub-section) number increments
        question_label = label_base.format(section_number)
        machines_sheet["A{}".format(active_row - 1)] = question_label

        # Process in model name (note assume Python 2 hence encode necessary)
        machines_sheet["B{}".format(active_row - 1)] = model.raw_name.encode()

        section_number += 1  # update sub-sub-sub-section for next question


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

    # Add some styles needed for coordinated formatting of processed cells.
    generic_template.add_named_style(QUESTION_HEADER_STYLE)
    generic_template.add_named_style(QUESTION_INPUT_BOX_STYLE)

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
