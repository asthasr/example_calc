#!/usr/bin/env ruby
require_relative "./calculator/adapters/adapter"

puts Calculator::Adapter::StringCalculator.new.process(ARGV[0])
