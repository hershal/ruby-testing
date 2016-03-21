#!/usr/bin/env ruby

require_relative 'tc_common'
require 'test/unit'

# Tests the BinaryTree Add implementation
class TestBinaryTreeAdd < TestBinaryTree
  def test_simple_0
    arr = [2, 1, 3]
    check(arr, assemble(arr))
  end

  def test_simple_1
    arr = [4, 2, 6, 1, 3, 5, 7]
    check(arr, assemble(arr))
  end

  def assemble(data)
    tree = BinaryTree.new
    data.each do |e|
      tree.add(e)
    end
    tree
  end

  def check(arr, tree)
    expected = arr.sort
    actual = tree.to_a
    assert(expected == actual, "#{expected} ne #{actual}")
  end
end
