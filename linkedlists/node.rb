# Encapsulates a linked list node, which contains numerical data as well as the
# next node in the linked list.
class Node
  attr_accessor :value, :next
  def initialize(value, next_node)
    @next = next_node
    @value = value
  end
end
