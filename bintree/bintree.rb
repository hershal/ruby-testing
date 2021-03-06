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

  ## A binary tree is said to be balanced if for each node in the tree, the
  ## difference in the height of its left and right of subtrees is at most one.
  ## A perfect binary tree is balanced, as is a complete binary tree. This
  ## checks whether the tree is balanced.
  def balanced_brute?
    _balanced_brute?(@root)
  end

  def _balanced_brute?(root)
    return true if root.nil?
    _balanced_brute?(root.left) && _balanced_brute?(root.right) &&
      ((_height(root.left) - _height(root.right)).abs <= 1)
  end

  def balanced?
    _balanced?(@root)[0]
  end

  def _balanced?(root)
    return [true, 0] if root.nil?

    left_status = _balanced?(root.left)
    right_status = _balanced?(root.right)
    return [false, 0] if !left_status[0] || !right_status[0]

    bal = (left_status[1] - right_status[1]).abs <= 1
    hei = [left_status[1], right_status[1]].max + 1
    [bal, hei]
  end

  ## The height of a binary tree is the maximum depth of any node in that tree.
  ## The depth of a node excludes the node itself.
  def height
    _height(@root) - 1
  end

  def _height(root)
    return 0 if root.nil?
    [_height(root.left), _height(root.right)].max + 1
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
