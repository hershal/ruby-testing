#!/usr/bin/env ruby

require_relative('node')

## Take two linked lists, assumed to be sorted, and return their merge. The only
## field that you may change is the =next= field.

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
