require_relative "../stack"

module Calculator
  module Port
    class StringCalculator
      include Port

      def initialize
        @stack = Stack.new
      end

      def process(str)
        str.split.each do |token|
          @stack.append(parse_token(token))
        end

        @stack.view
      end
    end
  end
end
