require_relative './arena'
require_relative './location' 
require_relative './robot' 



def print_header
  puts '----- Robot Wars -----'
  puts '----------------------'
end

def build_arena
  arena_created = false
  until arena_created
    puts 'Please enter the coordinates of the top right corner of the arena'
    input_top_right_corner = gets.chomp
    begin
      arena = Arena.new(input_top_right_corner)
      arena_created = true
    rescue StandardError => e
      puts e
    end
  end
  arena
end

def build_robot
    puts 'Please enter the coordinates and the direction of the position of the Robot'
    input_robot_position = gets.chomp
        robot = Robot.new(input_robot_position)
    return robot
end 


print_header
arena = build_arena
robot = build_robot
puts
puts "ARENA COORDINATES: (#{arena.bottom_left_corner.x};#{arena.bottom_left_corner.y})-(#{arena.top_right_corner.x};#{arena.top_right_corner.y})"
puts "ROBOT: (#{robot.current_location.x} #{robot.current_location.y} #{robot.current_direction})"
