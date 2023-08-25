module Notions
  module Types
    class Base
      def read_only?
        false
      end

      def serialize(value)
        raise NotImplementedError
      end

      def deserialize(property_fragment)
        raise NotImplementedError
      end
    end
  end
end
