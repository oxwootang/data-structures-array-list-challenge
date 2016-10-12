require_relative 'reporter'
require_relative 'fixed_array'

class ArrayList
  extend Reporter

  class OutOfBoundsError < StandardError; end

  def initialize(capacity = 2)
    @capacity = capacity
    @size = 0
    @contents = FixedArray.new(capacity)
  end

  def add(element)
    grow if at_capacity?

    @contents.set(@size, element)
    increment_size
  end

  def get(index)
    if !in_bounds?(index)
      raise OutOfBoundsError
    end

    @contents.get(index)
  end

  def set(index, element)
    if !in_bounds?(index)
      raise OutOfBoundsError
    end

    @contents.set(index)
  end

  def to_s
    @contents.to_s
  end

  private
  def in_bounds?(index)
    index >= 0 && index < @size
  end

  def at_capacity?
    @size == @capacity
  end

  def increment_size
    @size += 1
  end

  def grow
    new_capacity = @capacity * 2
    new_array = FixedArray.new(new_capacity)
    @contents.size.times do |i|
      new_array.set(i, @contents.get(i))
    end
    @capacity = new_capacity
    @contents = new_array
  end
end
