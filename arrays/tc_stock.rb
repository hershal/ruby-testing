require_relative 'stock'
require 'test/unit'

# Tests the StockProfitEstimator
class TestStockProfitEstimator < Test::Unit::TestCase
  def test_simple
    prices = [310, 315, 275, 295, 260, 270, 290, 230, 255, 250]
    expected_profit = 30
    check(prices, expected_profit)
  end

  def check(prices, expected_profit)
    pe = StockProfitEstimator.new(prices)
    estimated_profit = pe.estimate_brute
    assert(estimated_profit == expected_profit,
           'Estimated profit was not correct:' \
           " #{estimated_profit} ne #{expected_profit}")
  end
end
