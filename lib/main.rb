require_relative "./arena.rb"

def build_arena
    puts 'Please enter the coordinates of the top right corner of the arena'
    input_top_right_corner = gets.chomp
    arena = Arena.new(input_top_right_corner)
    puts arena.top_right_corner
end 

build_arena