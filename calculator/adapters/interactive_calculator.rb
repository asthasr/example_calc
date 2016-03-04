require_relative "../stack"
require_relative "../errors/error"

module Calculator
  module Adapter
    class InteractiveCalculator
      include Adapter

      def initialize
        @stack = Stack.new
      end

      def run
        loop do
          input = gets.strip.downcase

          if input == "q"
            return
          elsif input.empty?
            # Simply display the stack.
          else
            begin
              @stack.append(parse_token(input))
            rescue StandardError => e
              puts present_error(e)
            end
          end

          stack_view = @stack.view
          puts "Stack: #{stack_view.empty? ? '(empty)' : stack_view.join(', ')}"
        end
      end
    end
  end
end
