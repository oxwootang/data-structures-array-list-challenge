require_relative 'array_list'

describe ArrayList do

  describe "let" do

    let(:arrayList) { ArrayList.new }

    it "creates a new empty ArrayList" do
      expect(arrayList.size).to eq 0
    end

    it "adds to the ArrayList" do
      arrayList.add("butter")
      expect(arrayList.size).to eq 1
    end

  end

end
