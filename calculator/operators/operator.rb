require_relative "../errors/error"
Dir[File.dirname(__FILE__) + "/*.rb"].each { |file| require file }

module Calculator
  module Operator
    def arity
      2
    end

    def from_string(str)
      case str
      when "+"
        Add.new
      when "-"
        Subtract.new
      when "*"
        Multiply.new
      when "/"
        Divide.new
      else
        fail Error::UnknownValue, str
      end
    end
    module_function :from_string
  end
end
