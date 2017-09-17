module Lita
  module Handlers
    class OnewheelScheduled < Handler
      # insert handler code here
      route /^timerstart$/, :start
      route /^timerend$/, :end

      @x = false

      def start(response)
        every(5) do |timer|
          response.reply("This is your 60 second reminder!")
          timer.stop if @x
        end
      end

      def end(response)
        @x = true
        response.reply "Timer stopped."
      end

      Lita.register_handler(self)
    end
  end
end
