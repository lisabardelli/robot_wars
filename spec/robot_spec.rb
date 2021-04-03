require 'robot'

describe 'Robot' do
  before(:each) do
    @arena = Arena.new('5 5')
  end
  it 'creates an instance with valid inputs' do
    robot = Robot.new('1 2 N', @arena)
    expect(robot.current_location.x).to eq 1
    expect(robot.current_location.y).to eq 2
    expect(robot.current_direction).to eq 'N'
  end
  it 'returns an error if inputs are not valid' do
    expect { Robot.new('-12 2 N', @arena) }.to raise_error 'Invalid value'
    expect { Robot.new('Lorem 2 N', @arena) }.to raise_error 'Invalid value'
    expect { Robot.new('1 2 Lorem', @arena) }.to raise_error 'Invalid direction'
  end
  it 'returns an error if inputs are outside the arena' do
    expect { Robot.new('8 9 N', @arena) }.to raise_error 'Invalid location (outside the arena)'
  end

  it 'returns an error if instruction are not valida' do
    expect { Robot.new('1 2 N', 'LOREM', @arena) }.to raise_error 'Invalid instruction'
  end

  it 'rotates twice to the left' do
    robot = Robot.new('1 2 N', 'LL', @arena)
    expect(robot.current_direction).to eq 'S'
  end
  it 'rotates twice to the right' do
    robot = Robot.new('1 2 N', 'RR', @arena)
    expect(robot.current_direction).to eq 'S'
  end

  it 'rotates twice to the left and then to the right' do
    robot = Robot.new('1 2 N', 'LLR', @arena)
    expect(robot.current_direction).to eq 'W'
  end
  it 'rotates twice to the right and then to the left' do
    robot = Robot.new('1 2 N', 'RRL', @arena)
    expect(robot.current_direction).to eq 'E'
  end

  it 'moves LMLMLMLMM' do
    robot = Robot.new('1 2 N', 'LMLMLMLMM', @arena)
    expect(robot.current_location.x).to eq 1
    expect(robot.current_location.y).to eq 3
    expect(robot.current_direction).to eq 'N'
  end

  it 'moves MMRMMRMRRM' do
    robot = Robot.new('3 3 E', 'MMRMMRMRRM', @arena)
    expect(robot.current_location.x).to eq 5
    expect(robot.current_location.y).to eq 1
    expect(robot.current_direction).to eq 'E'
  end

  it 'did not move because move/rotate not valid' do
    robot = Robot.new('1 1 W', 'MMMMMMMMMMMM', @arena)
    expect(robot.current_location.x).to eq 0
    expect(robot.current_location.y).to eq 1
    expect(robot.current_direction).to eq 'W'
  end
end
