require "validates_unique_children/version"
require 'active_model'

module ActiveModel
  module Validations
    class ValidatesUniqueChildrenValidator < ActiveModel::EachValidator
      
      def initialize(options)
      end

      def validate_each(record, attribute, value)
        record.errors[attribute] << "wow it works"
      end

    end
  end
end
