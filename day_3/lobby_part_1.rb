
voltages = []
File.foreach('data.txt', chomp: true) do |line|

  digits = line.chars.map(&:to_i)
  max_voltage = 0

  (0..digits.count).each do |i|
    ((i+1)..digits.count).each do |j|
      voltage = "#{digits[i]}#{digits[j]}".to_i
      max_voltage = voltage if voltage > max_voltage
    end
  end

  voltages << max_voltage
end

p "Total voltage: #{voltages.sum}"

# OR

voltages = []
File.foreach('data.txt', chomp: true) do |line|
  digits = line.chars.map(&:to_i)
  max_voltage = 0

  digits.combination(2) do |comb|
    voltage = comb.join.to_i
    max_voltage = voltage if voltage > max_voltage
  end
  
  voltages << max_voltage
end

p "Total voltage: #{voltages.sum}"