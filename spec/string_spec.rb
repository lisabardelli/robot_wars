require 'string'

describe 'String' do
  it 'checks if a positive integer is a non negative integer' do
    positive_integer = '5'
    expect(positive_integer.a_non_negative_integer?).to be true
  end
  it 'checks if a negative integer is a non negative integer' do
    negative_integer = '-5'
    expect(negative_integer.a_non_negative_integer?).to be false
  end
  it 'checks if zero is a non negative integer' do
    zero = '0'
    expect(zero.a_non_negative_integer?).to be true
  end
  it 'checks if a string is a non negative integer' do
    string_var = 'Lorem'
    expect(string_var.a_non_negative_integer?).to be false
  end
  it 'checks if a positive float value is a positive integer' do
    float_var = '3.14'
    expect(float_var.a_non_negative_integer?).to be false
  end
  it 'checks if a negative float value is a positive integer' do
    float_var = '-3.14'
    expect(float_var.a_non_negative_integer?).to be false
  end
end
