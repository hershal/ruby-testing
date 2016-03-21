#!/usr/bin/env ruby

## Design a stack includes a =max= operation, in addition to =push= and =pop=.
## The =max= operation should return the maximum value stored in the stack.

# Encapsulates a stack which maintains the maximum value in the stack
class MaxStack
  def initialize
    @values = []
    @maxes = []
  end

  def max
    return nil if @maxes.empty?
    @maxes.last.value
  end

  def push(value)
    @values.push(value)
    push_max(value)
  end

  def pop
    pop_val = @values.pop
    pop_max(pop_val)
    pop_val
  end

  def empty?
    @values.empty? && @maxes.empty?
  end

  # Updates the max value stored in the =maxes= stack. Causes side-effects only.
  def push_max(value)
    last_val = max
    if @maxes.empty? || (!last_val.nil? && (value > last_val))
      @maxes.push(MaxStackValue.new(value))
    elsif last_val == value
      @maxes.last.inc
    end
  end

  def pop_max(value)
    last_val = max
    @maxes.last.dec if !@maxes.empty? && (!last_val.nil? && (last_val == value))
    @maxes.pop if @maxes.last.reps == 0
  end
end

# Data structure which encapsulates a value and a number of repetitions
class MaxStackValue
  attr_reader :value, :reps
  def initialize(value)
    @value = value
    @reps = 1
  end

  def inc
    @reps += 1
  end

  def dec
    @reps = [0, @reps - 1].max
  end
end
