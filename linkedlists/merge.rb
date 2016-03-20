#!/usr/bin/env ruby

## Take two linked lists, assumed to be sorted, and return their merge. The only
## field that you may change is the =next= field.

# Encapsulates a linked list node, which contains numerical data as well as the
# next node in the linked list.
class Node
  attr_accessor :value, :next
  def initialize(value, next_node)
    @next = next_node
    @value = value
  end
end

# Merges two sorted linked lists only changing the lists =next= field.
class ListMerger
  def merge(head0, head1)
    head0, head1 = head1, head0 if head1.value < head0.value
    head_merged = head0
    until head1.nil? || head0.next.nil?
      if head0.next.value > head1.value
        head1_tmp = head1.next
        head0_tmp = head0.next
        head0.next = head1
        head0.next.next = head0_tmp
        head1 = head1_tmp
      else
        head0 = head0.next
      end
    end
    head0.next = head1 if head0.next.nil?
    head_merged
  end
end
