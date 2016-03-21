# My implementation of find_index.
class Array
  def my_find_index(key)
    h = count - 1
    l = 0

    until h < l
      m = l + (h - l) / 2
      if self[m] > key
        h = m - 1
      elsif self[m] == key
        return _goto_first(key, m)
      else
        l = m + 1
      end
    end
    -1
  end

  def _goto_first(key, idx)
    idx -= 1 while idx > 0 && self[idx - 1] == key
    idx
  end
end
