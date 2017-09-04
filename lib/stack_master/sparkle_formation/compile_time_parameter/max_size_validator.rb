module StackMaster
  module SparkleFormation
    module CompileTimeParameter
      class MaxSizeValidator

        KEY = :max_size

        attr_reader :is_valid, :error

        def initialize(name, parameter_definition, value)
          @name = name
          @parameter_definition = parameter_definition
          @value = value
        end

        def validate
          @is_valid = check_is_valid
          @error = create_error unless @is_valid
        end

        private

        def check_is_valid
          return true unless @parameter_definition.key?(KEY)
          !value_is_greater_than_max_size?
        end

        def value_is_greater_than_max_size?
          @value.to_i > @parameter_definition[KEY].to_i
        end

        def create_error
          "#{@name}:#{@value} must not be greater than #{KEY}:#{@parameter_definition[KEY]}"
        end

      end
    end
  end
end
