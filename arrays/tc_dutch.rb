require_relative 'dutch'
require 'test/unit'

# Tests the DutchFlagPartitioner
class TestDutchFlagPartitioner < Test::Unit::TestCase
  def test_simple
    i = 1
    ar = [9, 5, 1, 6, 3]
    assert_brute(ar, i)
  end

  def test_multiple_equal
    i = 1
    ar = [9, 5, 1, 6, 3, 5]
    assert_brute(ar, i)
  end

  def test_no_lower
    i = 1
    ar = [1, 5, 1, 2, 3, 4]
    assert_brute(ar, i)
  end

  def test_no_higher
    i = 1
    ar = [7, 5, 8, 9, 10, 11]
    assert_brute(ar, i)
  end

  def assert_brute(ar, i)
    af = assemble_brute_flag(ar, i)
    assert(flag?(af, i), "#{af.inspect} not a flag")
  end

  def assemble_brute_flag(ar, i)
    part = DutchFlagPartitioner.new(ar, i)
    part.arrange_brute
  end

  def flag?(af, i)
    ai = af[i]
    af.each_with_index do |aa, idx|
      return false if (idx < i && aa > ai) || (idx > i && aa < ai)
    end
    true
  end
end
