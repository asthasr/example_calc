#!/usr/bin/env ruby

require_relative "./calculator/ports/port"

Calculator::Port::CliCalculator.new.run
