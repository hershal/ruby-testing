require_relative 'bintree'
require 'test/unit'

# Tests the BinaryTree Add implementation
class TestBinaryTree < Test::Unit::TestCase
  def assemble(data)
    tree = BinaryTree.new
    data.each do |e|
      tree.add(e)
    end
    tree
  end
end
