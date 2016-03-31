#!/usr/bin/env ruby

require_relative 'dijkstra'
require 'test/unit'

# Tests the Dijkstra Algorithm
class TestDijkstra < Test::Unit::TestCase
  def test_simple
    g = Graph.new({ 'a' => { 'b' => 14, 'c' => 7,  'd' => 9 },
                    'b' => { 'a' => 14, 'd' => 2,  'e' => 9 },
                    'c' => { 'a' => 7,  'd' => 10, 'f' => 15 },
                    'd' => { 'a' => 9,  'b' => 2,  'c' => 10, 'f' => 11 },
                    'e' => { 'b' => 9,  'f' => 6 },
                    'f' => { 'c' => 15, 'd' => 11, 'e' => 6 } })
    g.shortest_path('a')
  end
end
