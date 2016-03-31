## Dijkstra testing

require 'priority_queue'

# Represents a graph structure. Graph importing is done with the following
# structure: {'a' {'b' => 1}, 'b' => {'a' => 1}}.
class Graph
  attr_reader :nodes
  def initialize(node_structure)
    @nodes = []
    @node_names = {}
    node_structure.each do |k, v|
      node = Node.new(k, v)
      @nodes.push(node)
      @node_names[k] = node
    end
  end

  def get_node(name)
    @node_names[name]
  end

  # From name_a to name_b
  def shortest_path(start)
    visit_queue = PriorityQueue.new

    # holds name => dist pairs
    dists = {}
    parents = {}

    # holds Node => curr_dist pairs
    visit_queue.push(get_node(start), 0)

    until visit_queue.empty?
      u, dist = visit_queue.delete_min
      u.visit

      u.adjacents.each do |v_name, w|
        v = get_node(v_name)
        dists[u.name] = dist
        new_dist = dists[u.name] + w

        # relax
        if dists[v_name].nil? || new_dist < dists[v_name]
          dists[v_name] = new_dist
          parents[v_name] = u.name
          visit_queue.push(v, new_dist) unless v.visited?
        end
      end
    end

    zip_dicts(dists, parents)
  end
end

def zip_dicts(d0, d1_orig)
  d1 = d1_orig.clone
  dict = {}
  d0.each do |k, v|
    unless d1[k].nil?
      dict[k] = { first: v, second: d1[k] }
      d1.delete(k)
    end
  end

  d1.each do |k, v|
    dict[k] = { first: d0[k], second: v } unless d0[k].nil?
  end

  dict
end

# Represents a Graph Node whose adjacents are in the form of {'node_name' =>
# weight, ...}
class Node
  attr_reader :adjacents, :name
  def initialize(name, adjs)
    @name = name
    @visited = false
    @adjacents = PriorityQueue.new
    adjs.each do |k, v|
      @adjacents[k] = v
    end
  end

  def to_s
    "#{name}: #{adjacents.inspect}"
  end

  def visited?
    @visited
  end

  def visit
    @visited = true
  end
end
