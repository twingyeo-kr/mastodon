# frozen_string_literal: true

class ActivityPub::Adapter < ActiveModelSerializers::Adapter::Base
  def serializable_hash(options = nil)
    options = serialization_options(options)
    serialized_hash = { '@context': 'https://www.w3.org/ns/activitystreams' }.merge(ActiveModelSerializers::Adapter::Attributes.new(serializer, instance_options).serializable_hash(options))
    self.class.transform_key_casing!(serialized_hash, instance_options)
  end
end
