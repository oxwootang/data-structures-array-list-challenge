class ArrayList

  def initialize
    @size = 5
    @list = Array.new(@size)
    @count = 0
  end

  def add(element)
    if @count < @size
      @list[@count] = element
      @count += 1
    else
      @size *= 2
      @biggerList = Array.new(@size)
      for elem in @list do
        print elem
      end
    end
  end

  def size
    @count
  end

  def get(index)
    if index >= @count || index < 0
      raise 'OutOfBoundsException'
    else
      @list[index]
    end
  end

end
