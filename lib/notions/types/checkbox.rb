module Notions
  module Types
    class Checkbox < Base
      def serialize(value)
        { 'checkbox' => value }
      end

      def deserialize(property_fragment)
        property_fragment.fetch('checkbox')
      end
    end
  end
end
