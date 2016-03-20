#!/usr/bin/env ruby

## Take a string representing an integer and return the corresponding integer
## and vice versa. Negative integers should be handled.

# Converts a stringified number into its integer representation
class NumericString
  def stoi(str)
    num = 0
    negative = false
    str_arr = str.split(//)
    if str_arr[0] == '-'
      negative = true
      str_arr.shift
    end

    exponent = str_arr.count - 1
    zero = '0'.unpack('C')[0]
    str_arr.each do |e|
      num += (e.unpack('C')[0] - zero) * 10**exponent
      exponent -= 1
    end
    num = negative ? -num : num
  end
end
