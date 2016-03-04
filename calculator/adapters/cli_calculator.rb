require_relative "../stack"
require_relative "../errors/error"

module Calculator
  module Adapter
    class CliCalculator
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
            rescue Error::DivisionByZero
              puts "Cannot divide by zero!"
            rescue Error::TooFewOperands => e
              puts "There are too few values for that operation."
            rescue Error::UnknownValue => e
              puts "Invalid input: #{e.message}"
            end
          end

          stack_view = @stack.view
          puts "Stack: #{stack_view.empty? ? '(empty)' : stack_view.join(', ')}"
        end
      end
    end
  end
end
