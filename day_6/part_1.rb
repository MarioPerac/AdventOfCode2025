grid = []
File.foreach('data.txt', chomp: true) do |line|
  grid << line.split
end

operators = grid.pop
transposed_grid = grid.transpose

result = 0
transposed_grid.each_with_index do |row, index|
  row = row.map(&:to_i)
  result += operators[index] == '+' ? row.sum : row.reduce(1, :*)
end

p "Result: #{result}"