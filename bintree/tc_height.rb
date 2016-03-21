#!/usr/bin/env ruby

require_relative 'tc_common'
require 'test/unit'

# Tests the BinaryTree Height implementation
class TestBinaryTreeHeight < TestBinaryTree
  def test_simple_0
    arr = [2, 1, 3]
    check(1, assemble(arr))
  end

  def test_simple_1
    arr = [4, 2, 6, 1, 3, 5, 7]
    check(2, assemble(arr))
  end

  def test_simple_2
    arr = [1, 2, 3, 4, 5, 6, 7]
    check(6, assemble(arr))
  end

  def test_simple_3
    arr = [2, 1, 3, 4, 5, 6, 7]
    check(5, assemble(arr))
  end

  def check(expected, tree)
    actual = tree.height
    assert(expected == actual, "#{expected} ne #{actual}. Tree: #{tree.to_a.inspect}")
  end
end
