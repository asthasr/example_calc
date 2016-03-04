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
  end
end
