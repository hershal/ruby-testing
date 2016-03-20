#!/usr/bin/env ruby

## Write a program that takes an array =A= and an index =i= into =A=, and
## rearranges the elements such that all elements less than =A[i]= (the "pivot")
## appear first, followed by elements equal to the pivot, followed by elements
## greater than the pivot.

# Rearranges the elements in =A= such that all elements less than =A[i]= appear
# first, followed by elements equal to =A[i]=, followed by elements greater than
# =A[i]=.
class DutchFlagPartitioner
  def initialize(a, i)
    @a = a
    @i = i
  end

  # brute-force implementation: Maintain three separate arrays containing the
  # lower, upper, and equal elements. Combine these lists when done.
  def arrange_brute
    ai = @a[@i]
    a_lower = []
    a_upper = []
    a_equal = []
    @a.each do |aa|
      if aa < ai then a_lower << aa
      elsif aa == ai then a_equal << aa
      else a_upper << aa
      end
    end
    a_lower + a_equal + a_upper
  end
end
