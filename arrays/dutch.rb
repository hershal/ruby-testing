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

  # faster, smaller, in-place implementation
  def arrange_inplace
    ai = @a[@i]
    smaller = 0
    larger = @a.count
    j = 0
    while j < larger
      if @a[j] < ai
        @a[j], @a[smaller] = @a[smaller], @a[j]
        j += 1
        smaller += 1
      elsif @a[j] == ai
        j += 1
      else
        larger -= 1
        @a[j], @a[larger] = @a[larger], @a[j]
      end
    end
    @a
  end
end
