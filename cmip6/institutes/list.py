"""
.. module:: verify_repos.py
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Verifies that all CMIP6 instituional repos exist.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.jussieu.fr>

"""
from cmip6.utils import vocabs
from cmip6.utils import logger


def _main():
    """Main entry point.

    """
    for i in vocabs.get_institutes():
        logger.log(i.canonical_name)


# Main entry point.
if __name__ == '__main__':
    _main()
