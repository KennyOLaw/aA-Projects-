require "rspec"
require "functions"

describe "functional functions" do 
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
end 