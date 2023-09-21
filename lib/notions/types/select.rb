module Notions
  module Types
    class Select < Base
      def serialize(value)
        { 'select' => { 'name' => value } }
      end

      def deserialize(property_fragment)
        property_fragment.fetch('select').fetch('name')
      end
    end
  end
end
