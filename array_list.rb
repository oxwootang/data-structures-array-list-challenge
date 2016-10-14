require_relative 'fixed_array'

class ArrayList
  attr_reader :length

  class OutOfBoundsError < StandardError; end

  def initialize
    @fixed_array = FixedArray.new(8)
    @length = 0
  end

  def add(item)
    expand_array_capacity if length == fixed_array.size

    fixed_array.set(length, item)
    self.length += 1

    item
  end

  def get(index)
    raise OutOfBoundsError if index >= length
    fixed_array.get(index)
  end

  def set(index, value)
    raise OutOfBoundsError if index >= length
    fixed_array.set(index, value)
  end

  def insert(index, value)
    raise OutOfBoundsError if index >= length
    expand_array_capacity if length == fixed_array.size

    shift_items_right_from(index)
    fixed_array.set(index, value)
    self.length += 1

    value
  end

  private

  attr_accessor :fixed_array
  attr_writer :length

  def shift_items_right_from(index)
    last_index.downto(index).each do |i|
      move_item_right(i)
    end
  end

  def move_item_right(index)
    value = get(index)
    if index == last_index
      add(value)
    else
      set(index + 1, value)
    end
    set(index, nil)
  end

  def expand_array_capacity
    new_array = FixedArray.new(fixed_array.size * 2)

    0.upto(last_index).each do |i|
      value = fixed_array.get(i)
      new_array.set(i, value)
    end

    self.fixed_array = new_array
  end

  def last_index
    length - 1
  end
end
