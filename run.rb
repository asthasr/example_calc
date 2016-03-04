#!/usr/bin/env ruby

require_relative "./calculator/adapters/adapter"

Calculator::Adapter::CliCalculator.new.run
