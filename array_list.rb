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

end
