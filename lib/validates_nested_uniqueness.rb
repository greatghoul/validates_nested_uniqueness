require 'active_model'

module ActiveModel
  module Validations

    class NestedUniquenessValidator < ActiveModel::EachValidator

      def initialize(options)
        super(options)
        @klass = options[:class]
        @association = options[:association]
      end

      def validate_each(record, attribute, value)
        parent = nil
        ObjectSpace.each_object(eval(@klass)) { |r| parent = r if r.try(@association).include?(record) }
        if parent
          count = parent.try(@association).to_a.count { |r| r[attribute] == record[attribute] }
          if count > 1
            record.errors.add(attribute, 'duplicate', :value => 'val')
          end
        end
      end

    end

  end
end
