module Notions
  module Types
    class PhoneNumber < Base
      def serialize(value)
        { 'phone_number' => value }
      end

      def deserialize(property_fragment)
        property_fragment.fetch('phone_number')
      end
    end
  end
end
