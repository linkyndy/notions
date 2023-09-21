module Notions
  module Types
    class Array < Base
      def read_only?
        true
      end

      def deserialize(property_fragment)
        array = property_fragment.fetch('array')
        array.map do |item|
          type_class = Types.const_get(Util.camelize(item.fetch('type')))
          type_class.new.deserialize(item)
        end
      end
    end
  end
end
