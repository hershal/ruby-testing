# My implementation of find_index.
class Array
  def my_find_index(key)
    h = count - 1
    l = 0

    until h < l
      m = l + (h - l) / 2
      if self[m] > key
        h = m - 1
      elsif self[m] == key && self[m - 1] == key
        h = m
      elsif self[m] == key
        return m
      else
        l = m + 1
      end
    end
    -1
  end
end
