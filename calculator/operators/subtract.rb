module Calculator
  module Operator
    class Subtract
      include Operator

      def apply(x, y)
        x - y
      end
    end
  end
end
