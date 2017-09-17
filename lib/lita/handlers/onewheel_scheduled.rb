module Lita
  module Handlers
    class OnewheelScheduled < Handler
      # insert handler code here
      route /^timerstart$/, :start
      route /^timerend$/, :end

      @x = false

      def start(response)
        Lita.logger.debug "Starting timer!"
        every(5) do |timer|
          Lita.logger.debug "Timer running, X = #{x}"
          puts "Timer running, X = #{x}"
          timer.stop if x
          response.reply('This is your 5 second reminder!')
        end
      end

      def end(response)
        x = true
        Lita.logger.debug "Timer stopping, X = #{x}"
        response.reply 'Timer stopped.'
      end

      Lita.register_handler(self)
    end
  end
end
