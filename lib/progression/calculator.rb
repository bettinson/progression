module Calculator
  def self.ticks_per_bump(bar_size, count)
    count.fdiv(bar_size)
  end
end
