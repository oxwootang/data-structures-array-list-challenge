require_relative 'reporter'

class FixedArray
  extend Reporter
  attr_reader :size

  class OutOfBoundsError < StandardError; end

  track def initialize(size) #track "malloc"
    @size = size
    @contents = []
  end

  track def get(index) #track write
    check_bound(index)
    return contents[index]
  end

  track def set(index, value) #track read
    check_bound(index)
    contents[index] = value
  end

  def to_s
    @contents.to_s
  end

  private
  attr_reader :contents

  def check_bound(index)
    if index < 0 || index >= size
      raise OutOfBoundsError.new("#{index} outside the bounds of this FixedArray of size #{size}")
    end
  end
end
