require 'active_model'

module ActiveModel
  module Validations

    class NestedUniquenessValidator < ActiveModel::EachValidator

      def initialize(options)
        super(options)
        @klass =        get_class_name(options[:scope])
        @association =  options[:association]
        @message =      options[:message]
      end

      def validate_each(record, attribute, value)
        
        # working on trying to use conventions to determine association
        # also, if has only one belongs_to, can use that as a default.
        #puts record.class.name.underscore.to_sym
        #puts(eval(@klass).reflect_on_association(record.class.name.underscore.to_sym))
        
        if parent = get_parent(record)
          if get_child_count(parent, record, attribute) > 1
            record.errors.add(attribute, 
                              @message, 
                              :value => record[attribute] )
          end
        end
      end
      
      # Gets a class name from a symbol.
      def get_class_name(sym)
        sym.to_s.split('_').collect(&:capitalize).join
      end
      
      # Searches ObjectSpace for the parent object of record.
      #
      # It looks at all objects for the given class, then checks
      def get_parent(record)
        parent = nil
        ObjectSpace.each_object(eval(@klass)) { |r| 
          parent = r if r.try(@association).include?(record) 
        }
        parent
      end
      
      # Searches the parent for duplicate children.
      # A duplicate is defined as another child with an equivilant
      # attribute.
      def get_child_count(parent, record, attribute)
        count = parent.try(@association).to_a.count { |r| 
          r[attribute] == record[attribute] 
        }
      end

    end
  end
end
