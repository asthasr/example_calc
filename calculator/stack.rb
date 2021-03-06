require_relative "operators/operator"
require_relative "errors/error"

module Calculator
  class Stack
    def initialize
      @stack = []
      @operands = nil
    end

    def append(value)
      @stack.push case value
                  when Operator
                    value.apply(*operands(value))
                  when Numeric
                    value
                  else
                    fail Error::UnknownValue, value
                  end
    rescue StandardError => e
      @stack += @operands
      raise e
    end

    def view
      @stack.dup
    end

    private

    def operands(operator)
      if @stack.length < operator.arity
        fail Error::TooFewOperands, operator.arity
      else
        @operands = @stack.pop(operator.arity)
      end
    end
  end
end
