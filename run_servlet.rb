require "webrick"
require_relative "./calculator/adapters/adapter"

server = WEBrick::HTTPServer.new :Port => 8000
server.mount "/calculate", Calculator::Adapter::ServletCalculator
server.start
