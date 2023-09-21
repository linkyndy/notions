module Notions
  module Types
    class Url < Base
      def serialize(value)
        { 'url' => value }
      end

      def deserialize(property_fragment)
        property_fragment.fetch('url')
      end
    end
  end
end
