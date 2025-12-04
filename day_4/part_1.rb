
matrix = []
i = 0
File.foreach('data.txt', chomp: true) do |line|
  matrix[i] = line.chars
  i +=1
end

rolls_counter = 0

matrix.each_with_index do |row, row_index|
  row.each_with_index do |cell, col_index|

    next unless cell == '@'

    neighbors_counter = 0
    neighbor_row_start, neighbor_col_start  = row_index - 1, col_index - 1

    (neighbor_row_start..(neighbor_row_start + 2)).each do |i|
      next unless i.between?(0, matrix.length - 1)

      (neighbor_col_start..(neighbor_col_start + 2)).each do |j|
        next unless j.between?(0, row.length - 1)

        neighbors_counter += 1 if matrix[i][j] == '@' && [i, j] != [row_index, col_index]
      end
    end
    
    rolls_counter += 1 if neighbors_counter < 4
  end
end

p "Rolls counter: #{rolls_counter}"