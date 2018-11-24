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
    ticks_per_bump = Calculator.ticks_per_bump(window_size, count)

    if ticks_per_bump > 1
      tick_more_elements_than_bars(ticks_per_bump)
    else
      tick_more_bars_than_elements(ticks_per_bump)
    end
  end

  private

  attr_reader :size, :count

  def tick_more_elements_than_bars(ticks_per_bump)
    if @current_inner_tick >= ticks_per_bump
      print tick_character
      @current_inner_tick = 0
    end
    @current_inner_tick += 1
  end

  def tick_more_bars_than_elements(ticks_per_bump)
    bump_size.times do
      print tick_character
    end
  end

  def window_size
    @size ||= `tput cols`.strip.to_i
  end

  def bump_size
    (window_size/count).to_i
  end

  def tick_character
    '='
  end
end
