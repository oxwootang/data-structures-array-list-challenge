require_relative 'array_list'

describe ArrayList do
  let(:array_list) { ArrayList.new }

  before do
    array_list.add(:thing_1)
    array_list.add(:thing_2)
    array_list.add(:thing_3)
  end

  describe '#add' do
    it 'adds an element to the end of the list' do
      array_list.add(:thing_4)
      expect(array_list.get(3)).to eq(:thing_4)
    end
    
    it 'returns the element added' do
      expect(array_list.add(:thing_4)).to eq(:thing_4)
    end
    
    it 'handles lots of adds' do
      4.upto(15).each do |i|
        array_list.add("thing_#{i}".to_sym)
      end
      expect(array_list.length).to eq(15)
    end
  end

  describe '#get' do
    it 'returns element at specified index' do
      expect(array_list.get(0)).to eq(:thing_1)
      expect(array_list.get(1)).to eq(:thing_2)
      expect(array_list.get(2)).to eq(:thing_3)
    end

    it 'throws error if no element exists at specified index' do
      expect { array_list.get(3) }
        .to raise_error(ArrayList::OutOfBoundsError)
    end
  end

  describe '#set' do
    it 'replaces element at the specified index' do
      array_list.set(1, :new_thing)
      expect(array_list.get(1)).to eq(:new_thing)
    end
    
    it 'throws error if no element exists at specified index' do
      expect { array_list.set(3, :new_thing) }
        .to raise_error(ArrayList::OutOfBoundsError)
    end
  end

  describe '#insert' do
    it 'adds element with specified value at the specified index' do
      array_list.insert(1, :new_thing)
      expect(array_list.get(0)).to eq(:thing_1)
      expect(array_list.get(1)).to eq(:new_thing)
      expect(array_list.get(2)).to eq(:thing_2)
      expect(array_list.get(3)).to eq(:thing_3)
    end
    
    it 'throws error if no element exists at specified index' do
      expect { array_list.insert(3, :new_thing) }
        .to raise_error(ArrayList::OutOfBoundsError)
    end
  end

  describe '#length' do
    it 'returns number of items in list' do
      expect(array_list.length).to eq(3)
      array_list.add(:thing_4)
      expect(array_list.length).to eq(4)
    end
  end
end
