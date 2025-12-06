
lines = File.readlines('data.txt', chomp: true)

operators = lines.pop.split
transposed_lines = lines.map(&:chars).transpose

final_grid = []
array = []
transposed_lines.each_with_index do |row, i|
  if row.all? { |c| c == ' '}
    final_grid << array
    array = []
  elsif i == transposed_lines.size - 1
    array << row.compact.join.to_i
    final_grid << array
  else
    array << row.compact.join.to_i
  end
end

result = 0
final_grid.each_with_index do |row, index|
  result += operators[index] == '+' ? row.sum : row.reduce(1, :*)
end

p "Result: #{result}"