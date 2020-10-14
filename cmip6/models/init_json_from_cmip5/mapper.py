"""
.. module:: mapper.py
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Maps CMIP5 CIM (v1) model documents to lightweight IPython format.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.jussieu.fr>

"""
import os

import pyessv

import convertor
import defaults
import mappings

from cmip6.models.utils import ModelTopicOutput
from cmip6.utils import vocabs



class MappingInfo(object):
    """Encapsulates information to be mapped.

    """
    def __init__(self, cmip5_model_id, cmip5_component, cmip6_institution_id, cmip6_source_id, cmip6_topic):
        """Ctor.

        """
        self.cmip5_model_id = cmip5_model_id
        self.cmip5_component = cmip5_component
        self.cmip6_institution_id = cmip6_institution_id
        self.cmip6_source_id = cmip6_source_id
        self.cmip6_topic = cmip6_topic

        # Set parsed vocabs.
        self.cmip6_i = vocabs.get_institute(cmip6_institution_id)
        self.cmip6_s = vocabs.get_source(cmip6_institution_id, cmip6_source_id)
        self.cmip6_t = vocabs.get_source_topic(self.cmip6_s, cmip6_topic)


def map(info):
    """Maps a CMIP5 model component to a CMIP6 simplified output.

    :param MappingInfo info: Information to be mapped.

    :returns: CMIP6 simplified model document output.
    :rtype: dict

    """
    # Set output document to be seeded.
    doc = _get_document(info)

    # Set seeding source.
    doc.seeding_source = 'cmip5:{}'.format(info.cmip5_model_id)

    # Set injected properties.
    _set_injected_properties(info.cmip6_topic, info.cmip5_component, doc)

    # Set specialized properties.
    if info.cmip6_topic != 'toplevel':
        _set_specialized_properties(info.cmip5_component, doc)

    # Sort values.
    doc.sort_values()

    return doc


def _get_document(info):
    """Returns output document deleting JSON content if it already exists.

    """
    doc = ModelTopicOutput.create(info.cmip6_i, info.cmip6_s, info.cmip6_t)
    if os.path.exists(doc.fpath):
        os.remove(doc.fpath)
        doc = ModelTopicOutput.create(info.cmip6_i, info.cmip6_s, info.cmip6_t)

    
    return doc


def _set_injected_properties(cmip6_topic, c, doc):
    """Maps properties injected by tooling chain.

    Note: c = cmip5_component

    """
    # Topic overview.
    if c.description and len(c.description.strip()) > 0:
        spec_id = 'cmip6.{}.key_properties.overview'.format(cmip6_topic)
        doc.set_id(spec_id)
        doc.set_value(c.description)

    # Topic name.
    if c.long_name and len(c.long_name.strip()) > 0:
        spec_id = 'cmip6.{}.key_properties.name'.format(cmip6_topic)
        doc.set_id(spec_id)
        doc.set_value(c.long_name)

    # Escape if dealing with toplevel topic.
    if cmip6_topic == 'toplevel':
        return

    # Sub-topics.
    for c in [i for i in c.ext.component_tree
              if i.description and len(i.description.strip()) > 0]:
        # Get mapped CMIP6 identifier.
        try:
            mapped_identifier = mappings.get_cmip6_component_identifier(c)
        except KeyError:
            continue

        # Skip sub-processes
        if len(mapped_identifier.split('.')) > 3:
            continue

        # Sub-topic overview.
        if c.description and len(c.description.strip()) > 0:
            spec_id = '{}.overview'.format(mapped_identifier)
            doc.set_id(spec_id)
            doc.set_value(c.description)

        # Sub-topic name (level 1 sub-topics only).
        if mapped_identifier.split('.') == 3:
            if c.long_name and len(c.long_name.strip()) > 0:
                spec_id = '{}.name'.format(mapped_identifier)
                doc.set_id(spec_id)
                doc.set_value(str(c.long_name))


def _set_specialized_properties(c, doc):
    """Maps properties defined within specializations.

    """
    for p, spec in mappings.get_cmip5_component_properties(c):
        vals = convertor.convert_property_values(p.values, spec)
        doc.set_id(spec.id)
        for val in vals:
            try:
                doc.set_value(val)
            except ValueError:
                pass
