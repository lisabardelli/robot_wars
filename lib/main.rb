require_relative './arena'
require_relative './location'

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
  rescue => exception
    puts exception
  end 
end 
return arena
end

print_header()
arena = build_arena()
puts
puts "ARENA TOP RIGHT CORNER: (#{arena.top_right_corner.x};#{arena.top_right_corner.y})"
