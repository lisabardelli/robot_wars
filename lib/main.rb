require_relative './arena'

def print_header
    puts '----- Robot Wars -----'
    puts '----------------------'
end

def build_arena
  puts 'Please enter the coordinates of the top right corner of the arena'
  input_top_right_corner = gets.chomp
  arena = Arena.new(input_top_right_corner)
end

print_header()
arena = build_arena()
puts
puts "ARENA TOP RIGHT CORNER: (#{arena.top_right_corner.x};#{arena.top_right_corner.y})"
