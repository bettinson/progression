require_relative "progression/version"
require_relative "progression/calculator"

class Progression
  # Accept proc, tick
  def initialize(count, current = 0)
    @count = count
    @current = current
    @current_inner_tick = 0
  end

  def tick
    # TODO Store inner ticks. Bump progress bar necessary amount of times
    # when inner tick count reaches enough to move the terminal

    ticks_per_bump = Calculator.ticks_per_bump(window_size, count)

    if ticks_per_bump > 1
      tick_more_elements_than_bars(ticks_per_bump)
    # More bars than elements
    else
      tick_more_bars_than_elements(ticks_per_bump)
    end
  end

  private
  attr_reader :size, :count

  def window_size
    @size ||= `tput cols`.strip.to_i
  end

  def tick_more_elements_than_bars(ticks_per_bump)
    if @current_inner_tick >= ticks_per_bump
      print '#'
      @current_inner_tick = 0
    end
    @current_inner_tick += 1
  end

  def tick_more_bars_than_elements(ticks_per_bump)
    (window_size/count).to_i.times do
      print '#'
    end
  end
end

puts "More elements than bars in the window"
p = Progression.new(1000)

1000.times do
  p.tick
  sleep(0.001)
end

puts "More bars than elements in the window"
p = Progression.new(5)

5.times do
  p.tick
  sleep(0.5)
end
