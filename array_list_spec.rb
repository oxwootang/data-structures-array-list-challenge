require_relative 'array_list'

describe ArrayList do

  describe "let" do

    let(:arrayList) { ArrayList.new }

    it "creates a new empty ArrayList" do
      expect(arrayList.length).to eq 0
    end

    it "adds to the ArrayList" do
      arrayList.add("butter")
      expect(arrayList.length).to eq 1
    end

    it "raises an error when index is out of bounds for ArrayList#get" do
      arrayList.add("butter")
      arrayList.add("cookies")
      expect { arrayList.get(2) }.to raise_error 'OutOfBoundsException'
    end

    it "returns the value at the given index" do
      arrayList.add("butter")
      arrayList.add("eggs")
      arrayList.add("cookies")
      expect(arrayList.get(2)).to eq "cookies"
    end

    it "raises an error when index is out of bounds for ArrayList#set" do
        expect { arrayList.set(100, "100 birds") }.to raise_error "OutOfBoundsException"
    end

    it "sets the value at index of the list to the input element" do
      arrayList.add("butter")
      arrayList.add("eggs")
      arrayList.add("California")
      arrayList.set(2, "cookies")
      expect(arrayList.get(2)).to eq "cookies"
    end

  end

end
