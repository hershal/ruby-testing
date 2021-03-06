#!/usr/bin/env ruby

require_relative 'converter'
require 'test/unit'

# Tests the NumericString
class TestNumericString < Test::Unit::TestCase
  def test_simple
    str = '1'
    num = 1
    check(str, num)
  end

  def test_double_digit
    str = '12'
    num = 12
    check(str, num)
  end

  def test_triple_digit
    str = '123'
    num = 123
    check(str, num)
  end

  def test_triple_digit_leading_zero
    str = '0123'
    num = 123
    check(str, num)
  end

  def test_simple_negative
    str = '-1'
    num = -1
    check(str, num)
  end

  def test_double_digit_negative
    str = '-12'
    num = -12
    check(str, num)
  end

  def test_triple_digit_negative
    str = '-123'
    num = -123
    check(str, num)
  end

  def test_triple_digit_negative_leading_zero
    str = '-0123'
    num = -123
    check(str, num)
  end

  def check(str, num)
    converter = NumericString.new
    actual_num = converter.stoi(str)
    actual_str = converter.itos(num)
    assert(actual_num == num, "#{num} ne #{actual_num}")
    assert(actual_str == num.to_s, "#{num.to_s} ne #{actual_str}")
  end
end
