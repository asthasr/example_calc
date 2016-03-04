module Calculator
  module Operator
    class Divide
      include Operator

      def apply(x, y)
        fail Error::DivisionByZero if y == 0
        x / y
      end
    end
  end
end
