require "rspec"
require "functions"

describe Array do 
  describe "#my_unique" do 
    it "strips duplicate elements" do   
      expect([1,1,2,3].my_unique).to eq([1,2,3])
    end 
  end 

  describe "#two_sum" do
    it "returns array of pairs which sum to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq [[0, 4], [2, 3]]
    end
  end

  describe "#my_transpose" do
    let (:rows) { [[0, 1, 2],[3, 4, 5],[6, 7, 8]] }
    let (:cols) { [[0, 3, 6],[1, 4, 7],[2, 5, 8]] }
    it "returns the columns of a 2D array" do
      expect(rows.my_transpose).to eq cols
    end
  end
end

describe "#stock_picker" do
  let (:stock) { [351, 10, 330, 200, 455, 372, 246, 307, 271, 232, 404, 489, 86, 421, 226, 37, 292, 70, 420, 420, 395, 406, 20, 13, 419, 384, 123, 71, 247, 96] }

  it "returns best pair of days to purchase and sell stock" do
    expect(stock_picker(stock)).to eq [2,12]
  end
end