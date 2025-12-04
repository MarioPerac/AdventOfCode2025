
voltages = []

File.foreach('data.txt', chomp: true) do |line|
  digits = line.chars.map(&:to_i)

  max_voltage = []
  remaining_spots = 12
  excluded_values = []

  while(remaining_spots != 0)
    max_value, max_index = digits.each_with_index
                              .reject { |value, index| excluded_values.include?(value) }
                              .max_by { |value, index| value }

    if (digits.count - max_index) >= remaining_spots
      max_voltage << max_value 

      digits = digits[(max_index + 1)..-1]
      remaining_spots -= 1
      excluded_values.clear
    else
      excluded_values << max_value
    end
  end

    voltages << max_voltage.join.to_i
end

p "Total voltage: #{voltages.sum}"
