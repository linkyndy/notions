module Notions
  module Types
    class String < Base
      def read_only?
        true
      end

      def deserialize(property_fragment)
        property_fragment.fetch('string')
      end
    end
  end
end
