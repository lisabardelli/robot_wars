require 'arena'

describe 'Arena' do
  before(:each) do
    @input = '5 5'
    @arena = Arena.new(@input)
  end
  it 'creates an instance of the class with a top_right_corner attribute' do
    expect(@arena.top_right_corner.x).to eq 5
  end

  it 'returns true if the input is a string' do
    expect(@arena.is_input_a_string?('5')).to be true
  end

  it 'returns an error if the input is not a string' do
    expect { @arena.is_input_a_string?(5) }.to raise_error 'Arena input must be a string'
  end

  it 'returns the coordinates of the top_right_corner' do
    @arena.populate_top_right_corner(@input)
    expect(@arena.top_right_corner.x).to eq 5
    expect(@arena.top_right_corner.y).to eq 5
  end

  it 'returns an error if the input length is less than 2' do
    expect { @arena.populate_top_right_corner('5') }.to raise_error 'Too few arguments for Arena'
  end

  it 'returns an error if the input has invalid value' do
    expect { @arena.populate_top_right_corner('T e s t') }.to raise_error 'Invalid location'
  end
end
