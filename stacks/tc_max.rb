require_relative 'max'
require 'test/unit'

# Tests the MaxStack
class TestMaxStack < Test::Unit::TestCase
  # -- Test Cases --
  def test_simple
    check([4, 1, 2])
  end

  def test_simple_reversed
    check([2, 1, 4])
  end

  def test_repeat
    check([4, 4, 1, 2])
  end

  def test_repeat_reversed
    check([2, 1, 4, 4])
  end

  # -- Helper Methods --
  def check(values)
    stack = MaxStack.new
    check_stack = []

    values.each do |e|
      stack.push(e)
      check_stack.push(e)
      actual = stack.max
      expected = check_stack.max
      assert(expected == actual, "#{expected} ne #{actual}")
    end

    until check_stack.empty?
      actual = stack.max
      expected = check_stack.max
      assert(expected == actual, "#{expected} ne #{actual}")
      stack.pop
      check_stack.pop
    end

    assert(stack.empty?, "maxstack was not empty: #{stack.inspect}")
  end
end
