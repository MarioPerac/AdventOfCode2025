input_test = '11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124'

ranges = input_test.split(',')
invalid_ids = []

ranges.each do | range |
  first_id, last_id = range.split('-').map(&:to_i)

  next if first_id.digits.count.odd? && last_id.digits.count.odd?

  (first_id..last_id).each do |id|
    digits = id.digits
    digits_count = digits.count

    next if digits_count.odd?

    middle = (digits_count / 2)
    first_part = digits[0...middle]
    second_part = digits[middle..-1]

    invalid_ids << id if first_part == second_part
  end
end

p "Sum of invalid ids: #{invalid_ids.sum}"
