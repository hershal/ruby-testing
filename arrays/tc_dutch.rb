require_relative 'dutch'
require 'test/unit'

# Tests the DutchFlagPartitioner
class TestDutchFlagPartitioner < Test::Unit::TestCase
  # -- Test Cases --

  def test_simple
    i = 1
    ar = [9, 5, 1, 6, 3]
    check(ar, i)
  end

  def test_multiple_equal
    i = 1
    ar = [9, 5, 1, 6, 3, 5]
    check(ar, i)
  end

  def test_no_lower
    i = 1
    ar = [1, 5, 1, 2, 3, 4]
    check(ar, i)
  end

  def test_no_higher
    i = 1
    ar = [7, 5, 8, 9, 10, 11]
    check(ar, i)
  end

  def test_not_a_flag
    i = 1
    ar = [9, 5, 1, 6, 3]
    assert_notflag(ar, ar[i])
  end

  # -- Helper Methods --

  def check(ar, i)
    check_brute(ar, i)
    check_inplace(ar, i)
  end

  def check_brute(ar, i)
    part = DutchFlagPartitioner.new(ar, i)
    ai = ar[i]
    af = part.arrange_brute
    assert_flag(af, ai)
  end

  def check_inplace(ar, i)
    part = DutchFlagPartitioner.new(ar, i)
    ai = ar[i]
    af = part.arrange_inplace
    assert_flag(af, ai)
  end

  def assert_flag(af, ai)
    assert(flag?(af, ai), "#{af.inspect} not a flag")
  end

  def assert_notflag(af, ai)
    assert(!flag?(af, ai), "#{af.inspect} is a flag (test for notflag)")
  end

  def flag?(af, ai)
    crossed_pivot = false
    af.each do |aa|
      crossed_pivot ||= (aa == ai)
      return false if (!crossed_pivot && (aa > ai)) ||
                      (crossed_pivot && (aa < ai))
    end
    true
  end
end
