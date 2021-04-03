require 'location'

describe 'Location' do
  it 'creates an instance of the class with x and y attributes' do
    location = Location.new(5, 5)
    expect(location.x).to eq 5
    expect(location.y).to eq 5
  end
  it 'returns an error if x or/and y is/are negative ' do
    expect { Location.new(5, -5) }.to raise_error 'Negative value'
    expect { Location.new(-5, 5) }.to raise_error 'Negative value'
    expect { Location.new(-5, -5) }.to raise_error 'Negative value'
  end
end
