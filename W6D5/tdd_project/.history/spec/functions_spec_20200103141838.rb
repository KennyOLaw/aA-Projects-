require "rspec"
require "functions"

describe "functional functions" do 
  describe "#my_unique" do 
    it "strips dups elements" do   
        expect([1,1,2,3].my_unique).to eq([1,2,3])
    end 
  end 
end 