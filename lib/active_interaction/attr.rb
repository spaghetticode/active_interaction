module ActiveInteraction
  module Attr
    def self.factory(attr_type)
      klass = "#{attr_type.to_s.capitalize}Attr"

      raise NoMethodError unless ActiveInteraction.const_defined?(klass)

      ActiveInteraction.const_get(klass)
    end

    def return_nil(allow_nil)
      if allow_nil
        nil
      else
        raise MissingValue
      end
    end
    private :return_nil

    def bad_value
      raise InvalidValue
    end
    private :bad_value
  end
end
