#!/usr/bin/env ruby

require_relative 'heap'
require 'test/unit'

# Tests the MinHeap implementation, i.e. ensures the heap property is conserved
class TestMinHeap < Test::Unit::TestCase
  def test_simple_0
    vals = [1, 2, 5, 10]
    check(vals)
  end

  def test_simple_1
    vals = [10, 5, 2, 1]
    check(vals)
  end

  def test_simple_3
    vals = [1, 2, 5, 10, 3, 7, 11, 15, 17, 20, 9, 15, 8, 16, 3]
    check(vals)
  end

  def test_random
    vals = Array.new(100) { rand(0..50) }
    check(vals)
  end

  def check(values)
    heap = MinHeap.new
    vals_added = []
    values.each do |e|
      vals_added.push(e)
      heap.add(e)
      explicit_check(vals_added, heap)
    end

    until heap.empty?
      pop_expect = vals_added.min
      pop_actual = heap.pop
      assert(pop_expect == pop_actual, "#{pop_expect} ne #{pop_actual}, #{heap}")
      vals_added.delete_at(vals_added.find_index(pop_expect))
      explicit_check(vals_added, heap)
    end
  end

  def explicit_check(vals_added, heap)
    expected = vals_added.min
    actual = heap.min
    assert(heap.min == vals_added.min, "#{expected} ne #{actual}, #{heap}")
  end
end
