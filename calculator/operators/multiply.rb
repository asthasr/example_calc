module Calculator
  module Operator
    class Multiply
      include Operator

      def apply(x, y)
        x * y
      end
    end
  end
end
