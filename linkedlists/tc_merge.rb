#!/usr/bin/env ruby

require_relative 'merge'
require 'test/unit'

# Tests the ListMerger
class TestListMerger < Test::Unit::TestCase
  # -- Test Cases --
  def test_simple_0
    head0 = assemble([0, 2, 4, 6])
    head1 = assemble([1, 3, 5, 7])
    check(head0, head1)
  end

  def test_simple_1
    head0 = assemble([1, 3, 5, 7])
    head1 = assemble([0, 2, 4, 6])
    check(head0, head1)
  end

  def test_simple_2
    head0 = assemble([0, 1, 2])
    head1 = assemble([0, 3, 4])
    check(head0, head1)
  end

  def test_simple_3
    head0 = assemble([0, 3, 4])
    head1 = assemble([0, 1, 2])
    check(head0, head1)
  end

  # -- Helper Methods --
  def assemble(values)
    head = nil
    values.reverse.each do |e|
      head = Node.new(e, head)
    end
    head
  end

  def to_s(head)
    local = head
    until local.nil?
      print local.value.to_s + ' -> '
      local = local.next
    end
    puts 'nil'
  end

  def check(head0, head1)
    merger = ListMerger.new
    merged = merger.merge(head0, head1)
    until merged.next.nil?
      assert(merged.value <= merged.next.value)
      merged = merged.next
    end
  end
end
