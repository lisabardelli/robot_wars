require 'location'

describe 'Location' do
  it 'creates an instance of the class with x and y attributes' do
    location = Location.new(5, 5)
    expect(location.x).to eq 5
    expect(location.y).to eq 5
  end
end
