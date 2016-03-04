require "webrick"
require_relative "../errors/error"

module Calculator
  module Adapter
    class ServletCalculator < WEBrick::HTTPServlet::AbstractServlet
      include Adapter

      def do_POST(req, res)
        begin
          stack = StringCalculator.new.process(req.body)

          if stack.length > 1
            set_response res, 400, "Incomplete expression"
          else
            set_response res, 200, stack.last.to_s
          end
        rescue StandardError => e
          set_response res, 400, present_error(e)
        end
      end

      private

      def set_response(res, status, content)
        res["Content-Type"] = "text/plain"
        res.status = status
        res.body = content
      end
    end
  end
end
