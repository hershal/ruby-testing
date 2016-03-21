#!/usr/bin/env ruby

# A sorted binary tree which contains a reference to the root of the tree and
# algorithms to operate on the tree.
class BinaryTree
  def initialize
    @root = nil
  end

  # Publicly accessable node adder
  def add(data)
    if @root.nil?
      @root = BinaryNode.new(data)
    else
      _add(data, @root)
    end
  end

  # implementation specific node adder
  def _add(data, root)
    if data < root.data
      if root.left.nil?
        root.left = BinaryNode.new(data)
      else
        _add(data, root.left)
      end
    else
      if root.right.nil?
        root.right = BinaryNode.new(data)
      else
        _add(data, root.right)
      end
    end
  end

  ## The height of a binary tree is the maximum depth of any node in that tree.
  ## The depth of a node excludes the node itself.
  def height
    _height(@root) - 1
  end

  def _height(root)
    return 0 if root.nil?
    [_height(root.left) + 1, _height(root.right) + 1].max
  end

  def to_a
    _to_a(@root)
  end

  def _to_a(root)
    return if root.nil?
    [_to_a(root.left), root.data, _to_a(root.right)].compact.flatten
  end
end

# Encapsulates a binary node, which contains some data as well as references to
# its left and right children.
class BinaryNode
  attr_accessor :left, :right
  attr_reader :data

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end
