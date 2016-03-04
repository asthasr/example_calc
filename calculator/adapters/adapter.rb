require_relative "../errors/error"
require_relative "../operators/operator"
Dir[File.dirname(__FILE__) + "/*.rb"].each { |file| require file }

module Calculator
  module Adapter
    def parse_token(str)
      if str =~ /^-?\d+(\.\d+)?$/    
        str.to_f
      else
        Operator.from_string(str)
      end
    rescue
      fail Error::UnknownValue, str
    end

    def present_error(e)
      case e
      when Error::DivisionByZero
        "Cannot divide by zero!"
      when Error::TooFewOperands
        "There are too few values for that operation."
      when Error::UnknownValue
        "Invalid input: #{e.message}"
      else
        raise e
      end
    end
  end
end
