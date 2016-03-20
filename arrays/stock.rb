#!/usr/bin/env ruby

## Write a program that takes an array denoting the daily stock price, and
## returns the maximum profit that could be made by buying and then selling one
## share of that stock.

# Given a sequence of daily stock prices =prices=, the StockProfitEstimator
# estimates the amount of profit that could have been made by buying and selling
# one share of that stock.
class StockProfitEstimator
  def initialize(prices)
    @prices = prices
  end

  def estimate_brute
    max_estimate = 0
    max_i = 0
    max_j = 0
    @prices.each_with_index do |e, i|
      (i..(@prices.count - 1)).each do |j|
        estimated_profit = @prices[j] - @prices[i]
        puts [estimated_profit, i, j].inspect
        if estimated_profit > max_estimate
          max_estimate = estimated_profit
          max_i = i
          max_j = j
        end
      end
    end
    max_estimate
  end
end
