module Notions
  module Types
    class Boolean < Base
      def read_only?
        true
      end

      def deserialize(property_fragment)
        property_fragment.fetch('boolean')
      end
    end
  end
end
