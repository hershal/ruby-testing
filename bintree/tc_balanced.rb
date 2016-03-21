#!/usr/bin/env ruby

require_relative 'tc_common'
require 'test/unit'

# Tests the BinaryTree Balanced? implementation
class TestBinaryTreeBalanced < TestBinaryTree
  def test_simple_0
    arr = [2, 1, 3]
    check(true, assemble(arr))
  end

  def test_simple_1
    arr = [4, 2, 6, 1, 3, 5, 7]
    check(true, assemble(arr))
  end

  def test_simple_2
    arr = [1, 2, 3, 4, 5, 6, 7]
    check(false, assemble(arr))
  end

  def test_simple_3
    arr = [2, 1, 3, 4, 5, 6, 7]
    check(false, assemble(arr))
  end

  def test_simple_4
    arr = [4, 2, 5, 1, 3, 7]
    check(true, assemble(arr))
  end

  def test_simple_5
    arr = [4, 2, 5, 1, 3, 7, 6]
    check(false, assemble(arr))
  end

  def check(expected, tree)
    actual_brute = tree.balanced_brute?
    assert(expected == actual_brute,
           "#{expected} ne #{actual_brute}. Tree: #{tree.to_a.inspect}")
    actual = tree.balanced?
    assert(expected == actual,
           "#{expected} ne #{actual}. Tree: #{tree.to_a.inspect}")
  end
end
