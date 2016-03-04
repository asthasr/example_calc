module Calculator
  module Error
    class DivisionByZero < StandardError; end
    class TooFewOperands < StandardError; end
    class UnknownValue < StandardError; end
  end
end
