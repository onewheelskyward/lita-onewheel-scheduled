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
          Lita.logger.debug "Timer running, X = #{self.x}"
          timer.stop if self.x
        end
      end

      def end(response)
        self.x = true
        Lita.logger.debug "Timer stopping, X = #{self.x}"
        response.reply "Timer stopped."
      end

      Lita.register_handler(self)
    end
  end
end
