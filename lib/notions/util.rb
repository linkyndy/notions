module Notions
  module Util
    extend self

    def camelize(str)
      str.split('_').map(&:capitalize).join
    end
  end
end
