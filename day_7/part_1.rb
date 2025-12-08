lines = File.readlines('data.txt', chomp: true)

count = 0
positions = []
start_position = lines.first.index('S')
positions << start_position

lines[1..].each do |line|
  next_positions = []
  positions.each do |position|

    if line[position] == '^'
      line[position - 1] = '|'
      line[position + 1] = '|'
      count += 1
      next_positions << position - 1
      next_positions << position + 1
    elsif line[position] == '.'
      line[position] = '|'
      next_positions << position
    end
  end
  positions = next_positions
end

lines.each do |line| p line end
p "Count: #{count}"