require 'robot'


describe "Robot" do

    it "creates an instance with valid inputs" do
        robot = Robot.new("1 2 N")
        expect(robot.current_location.x).to eq 1
        expect(robot.current_location.y).to eq 2
        expect(robot.current_direction).to eq "N"
    end 
    it "returns an error if inputs are not valid" do
        expect { Robot.new("-12 2 N")}.to raise_error 'Invalid value'
        expect { Robot.new("Lorem 2 N")}.to raise_error 'Invalid value'
        expect { Robot.new("1 2 Lorem")}.to raise_error 'Invalid direction'
 
    end 
end 