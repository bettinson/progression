require "progression/version"

class Progression
  def initialize(count, current = 0)
    @count = count
    @current = current
    # Accept proc, tick
  end

  def tick
    # TODO Store inner ticks. Bump progress bar necessary amount of times
    # when inner tick count reaches enough to move the terminal

    ticks_per_bump = Calculator.ticks_per_bump(window_size, count)
    size.times do
      puts '.'
    end
  end

  private
  attr_reader :size, :count

  def window_size
    @size ||= `tput cols`.strip.to_i
  end
end
