class ArrayList

  def initialize
    @size = 5
    @list = Array.new(@size)
    @count = 0
  end

  def increaseSize
    @size *= 2
    biggerList = Array.new(@size)
    tally = 0
    for elem in @list do
      biggerList[tally] = elem
      tally += 1
    end
    @list = biggerList
  end

  def add(element)
    if @count < @size
      @list[@count] = element
      @count += 1
    else
      increaseSize
      @list[@count] = element
      @count += 1
    end
  end

  def length
    @count
  end

  def get(index)
    if index >= @count || index < 0
      raise 'OutOfBoundsException'
    else
      @list[index]
    end
  end

  def set(index, element)
    if index >= @count || index < 0
      raise 'OutOfBoundsException'
    else
      @list[index] = element
    end
  end

  def insert(index, element)
    if index >=@count || index < 0
      raise 'OutOfBoundsException'
    else
      if @count == @size
        increaseSize
      end
      tally = @count - 1
      while tally >= index do
        @list[tally+1] = @list[tally]
        tally -= 1
      end
      @list[index] = element
      @count += 1
    end
  end

end
