require 'progression/calculator'

RSpec.describe Calculator do
  it 'calculates how many ticks are needed per progress bar bump' do
    bar_size = 200
    count = 100
    ticks = Calculator.ticks_per_bump(bar_size, count)
    expect(ticks).to eq(0.5)
  end
end

