
matrix = []
i = 0
File.foreach('data.txt', chomp: true) do |line|
  matrix[i] = line.chars
  i +=1
end

matrix_copy = matrix.map(&:dup)
total_rolls = 0

loop do
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
      
      if neighbors_counter < 4
        rolls_counter += 1 
        matrix_copy[row_index][col_index] = '.'
      end
    end
  end

  matrix.each do |row|
    puts row.join
  end

  matrix = matrix_copy.map(&:dup)

  p "Rolls counter: #{rolls_counter}"
  p '================================='

  break if rolls_counter == 0

  total_rolls += rolls_counter
end

p "Total Rolls: #{total_rolls}"
