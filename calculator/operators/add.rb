module Calculator
  module Operator
    class Add
      include Operator

      def apply(x, y)
        x + y
      end
    end
  end
end
