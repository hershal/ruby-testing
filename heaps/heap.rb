# Describes a specialized binary tree structure which satisfies the Heap
# Property: the key at each node is at least as great as the keys stored at its
# children. Furthermore a heap is a complete binary tree, that is, every level
# except possibly the last is completely filled and all nodes are as far left as
# possible. This minimum heap is implemented by an implicit-linkage (opposed to
# an explicit tree-like linkage).
class MinHeap
  def initialize
    @elements = []
  end

  def empty?
    @elements.empty?
  end

  def add(data)
    @elements.push(data)

    idx = @elements.count - 1
    until idx == 0
      cur = @elements[idx]
      bck_idx = _back(idx)
      bck = @elements[bck_idx]
      if cur < bck
        @elements[idx] = bck
        @elements[bck_idx] = cur
      end
      idx = bck_idx
    end
  end

  def delete_min
    m = @elements.shift
    i = 0
    loop do
      li = _left(i)
      ri = _right(i)
      break if (li.nil? && ri.nil?) || i > @elements.count
      if !li.nil? && @elements[li] < @elements[i]
        @elements[i], @elements[li] = @elements[li], @elements[i]
      end
      if !ri.nil? && @elements[ri] < @elements[i]
        @elements[i], @elements[ri] = @elements[ri], @elements[i]
      end
      i += 1
    end
    m
  end

  def min
    @elements[0]
  end

  def _left(i)
    l = (2 * i) + 1
    return nil if l >= @elements.count
    l
  end

  def _right(i)
    r = (2 * i) + 2
    return nil if r >= @elements.count
    r
  end

  def _back(i)
    return (i / 2) - 1 if i.even?
    (i / 2).to_int
  end

  def to_s
    @elements.inspect
  end
end
