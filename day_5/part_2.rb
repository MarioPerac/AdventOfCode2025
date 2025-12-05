ranges = []
File.foreach('data_2.txt', chomp: true) do |line|
 
  first, second = line.split('-').map(&:to_i)
  ranges << [first, second]
end

ranges = ranges.sort
merged_ranges = []

i = 0
while(i < ranges.size)
  range = ranges[i]

  j = i + 1
  while(j < ranges.size)

    r0, r1 = ranges[j]

    if range[1] >= r0  && range[0] <= r1
      range[0] = [range.first, r0].min
      range[1] = [range.last, r1].max
      j += 1
    else 
      break
    end
  end

  merged_ranges << range
  i = j
end

sum = 0
merged_ranges.each do |r0, r1|
  sum += r1 - r0 + 1
end
puts "Sum: #{sum}"
