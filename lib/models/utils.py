"""
.. module:: utils.py
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Model topic notebook data wrapper.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.jussieu.fr>


"""
import collections
import json
import os

from pyesdoc.mp.specializations.utils_cache import get_topic_specialization
from pyesdoc.mp.specializations.utils_cache import get_property_specialization

from lib.utils import vocabs
from lib.utils import io_mgr



# Null property value.
_NULL_PROPERTY = lambda: {'values': []}


class ModelTopicOutput(object):
    """Model topic documentation output wrapper.

    """
    def __init__(self, mip_era, institute, source_id, topic):
        """Instance initialiser.

        """
        self.authors = []
        self.citations = []
        self.content = dict()
        self.fpath = io_mgr.get_model_topic_json(institute, source_id, topic)
        self.institute = institute.canonical_name
        self.mip_era = unicode(mip_era).strip().lower()
        self.parties = []
        self.seeding_source = None
        self.source_id = source_id.canonical_name
        self.specialization = get_topic_specialization(mip_era, topic.canonical_name)
        self.topic = topic.canonical_name
        self._prop = None
        self._prop_specialization = None

        # Auto initialise from JSON output file.
        if os.path.isfile(self.fpath):
            obj = io_mgr.load_model_topic_json(institute, source_id, topic)
            self._from_dict(obj)


    @classmethod
    def create(cls, i, s, t):
        """Get notebook output wrapper instance.

        :param str m: MIP era, e.g. cmip6.
        :param pyessv.Term i: Institute.
        :param pyessv.Term s: Model source.
        :param pyessv.Term t: Documentation topic.

        :returns: Model topic documentation output wrapper instance.
        :rtype: ModelTopicOutput

        """
        return cls('CMIP6', i, s, t)


    def save(self):
        """Persists state to file system.

        """
        with open(self.fpath, 'w') as fstream:
            fstream.write(json.dumps(self._to_dict(), indent=4))


    def _from_dict(self, obj):
        """Initialises internal state from a dictionary.

        """
        self.citations = obj.get('citations', [])
        self.content = obj['content']
        self.institute = obj['institute']
        self.mip_era = obj['mipEra']
        self.parties = obj.get('parties', [])
        self.seeding_source = obj.get('seedingSource')
        self.source_id = obj['sourceID']
        self.topic = obj['topic']


    def _to_dict(self):
        """Returns a dictionary representation of internal state.

        """
        obj = collections.OrderedDict()
        obj['mipEra'] = self.mip_era
        obj['institute'] = self.institute
        obj['seedingSource'] = self.seeding_source
        obj['sourceID'] = self.source_id
        obj['topic'] = self.topic
        obj['content'] = collections.OrderedDict()
        for specialization_id in sorted(self.content.keys()):
            specialization_obj = self.content[specialization_id]
            if specialization_obj['values']:
                obj['content'][specialization_id] = self.content[specialization_id]

        print 'TODO: encode citations  & parties'

        return obj


    def set_id(self, prop_id):
        """Sets id of specialized property being edited.

        """
        self.content[prop_id] = self.content.get(prop_id, _NULL_PROPERTY())
        self._prop = self.content[prop_id]
        self._prop_specialization = get_property_specialization(prop_id)


    def set_value(self, val):
        """Sets a scalar value.

        :param obj val: Value to be assigned.

        """
        # Validate input:
        # ... error if trying to add > 1 value to a property with singular cardinality.
        if not self._prop_specialization.is_collection and \
           len(self._prop['values']) >= 1:
            raise ValueError('Invalid property: only one value can be added')

        # ... error if adding a duplicate value.
        if val in self._prop['values']:
            raise ValueError('Invalid property: cannot add duplicate values')

        # ... error if specialization complains.
        self._prop_specialization.validate_value(val)

        # Update state.
        self._prop['values'].append(val)


    def sort_values(self):
        """Sorts current property values.

        """
        self._prop['values'] = sorted(self._prop['values'])


    def get_values(self, specialization_id):
        """Returns a set of values.

        """
        return self.content.get(specialization_id, dict()).get('values', [])


    def get_comma_delimited_values(self, specialization_id):
        """Returns a set of comma delimited values.

        """
        value = self.get_value(specialization_id)

        return [i.trim() for i in value.split(',')] if value else []


    def get_value(self, specialization_id):
        """Returns a single value.

        """
        values = self.get_values(specialization_id)

        return values[0] if values else None

