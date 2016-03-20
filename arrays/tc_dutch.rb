require_relative 'dutch'
require 'test/unit'

# Tests the DutchFlagPartitioner
class TestDutchFlagPartitioner < Test::Unit::TestCase
  def test_brute_simple
    i = 1
    ar = [9, 5, 1, 6, 3]
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
