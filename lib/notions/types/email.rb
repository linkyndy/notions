module Notions
  module Types
    class Email < Base
      def serialize(value)
        { 'email' => value }
      end

      def deserialize(property_fragment)
        property_fragment.fetch('email')
      end
    end
  end
end
