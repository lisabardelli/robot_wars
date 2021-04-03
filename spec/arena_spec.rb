require "arena"

describe "Arena" do

    before(:each) do
        @arena = Arena.new("5 5")
    end 
    it "creates an instance of the class with a top_right_corner attribute" do
        expect(@arena.top_right_corner).to eq "5 5"
    end 

    it "returns true if the input is a string" do
        expect(@arena.is_input_a_string("5")).to be true
    end 

    it "returns an error if the input is not a string" do
        expect{@arena.is_input_a_string(5)}.to raise_error 'Arena input must be a string'
    end 

end 