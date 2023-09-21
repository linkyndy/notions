module Notions
  module Types
    class Number < Base
      def serialize(value)
        { 'number' => value }
      end

      def deserialize(property_fragment)
        property_fragment.fetch('number')
      end
    end
  end
end
