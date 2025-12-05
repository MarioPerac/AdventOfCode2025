
ranges = []
ids = []

File.foreach('data.txt', chomp: true) do |line|
    next if line.empty?

    if line.include?('-')
      first, second = line.split('-').map(&:to_i)
      ranges << [first, second]
    else
      ids << line.to_i
    end
end


fresh_ingrediant_counter = 0

ids.each do |id|

  ranges.each do |range|

    if id.between?(range.first, range.last)
      fresh_ingrediant_counter += 1
      break
    end
  end

end

p "Number of fresh ingrediants: #{fresh_ingrediant_counter}"