#!/usr/bin/env ruby

require_relative 'first'
require 'test/unit'

class TestFindFirst < Test::Unit::TestCase
  def test_simple_0
    check([1, 2, 3, 3, 4, 5, 6], 3)
  end

  def test_simple_1
    check([1, 1, 2, 3, 4, 5, 6], 1)
  end

  def test_simple_2
    check([1, 2, 3, 4, 5, 6, 6], 6)
  end

  def test_simple_3
    check([0, 1, 4, 4, 4, 5, 8, 9, 10, 10], 0)
  end

  def test_random_small
    generate_random(0..10, 10, 100)
  end

  def test_random_large
    generate_random(0..100, 100, 100)
  end

  def generate_random(range, len, times)
    times.times do
      arr = Array.new(len) { rand(range) }
      range.each do |key|
        check(arr, key)
      end
    end
  end

  def check(arr, key)
    arr.sort!
    expected = arr.find_index(key)
    expected = expected.nil? ? -1 : expected
    actual = arr.my_find_index(key)
    assert(expected == actual,
           "#{expected} ne #{actual} for key #{key} in #{arr.inspect}")
  end
end
