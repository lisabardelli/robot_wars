require 'arena'

describe 'Arena' do
  it 'returns the coordinates of the top_right_corner' do
    arena = Arena.new('5 5')
    expect(arena.top_right_corner.x).to eq 5
    expect(arena.top_right_corner.y).to eq 5
  end

  it 'returns an error if the input is not a string' do
    expect { Arena.new(5) }.to raise_error 'Arena input must be a string'
  end

  it 'returns an error if the input length is less than 2' do
    expect { Arena.new('5') }.to raise_error 'Too few arguments for Arena'
  end

  it 'returns an error if the input has invalid value' do
    expect { Arena.new('5 invalid') }.to raise_error 'Invalid location'
  end

  it 'returns an error if the location x is outside the range' do
    arena = Arena.new('5 5')
    location = Location.new(7, 2)
    expect(arena.a_valid_location?(location)).to be false
  end
  it 'returns an error if the location y is outside the range' do
    arena = Arena.new('5 5')
    location = Location.new(2, 7)
    expect(arena.a_valid_location?(location)).to be false
  end
  it 'returns an error if the location is already occupied' do
    location1 = Location.new(2, 3)
    arena = Arena.new('5 5', [location1])
    location2 = Location.new(2, 3)
    expect { arena.add_occupied_location(location2) }.to raise_error 'Invalid location'
  end

  it 'checks if an already occupied location is valid' do
    location1 = Location.new(2, 3)
    arena = Arena.new('5 5', [location1])
    location2 = Location.new(2, 3)
    expect(arena.a_valid_location?(location2)).to be false
  end
end
