input_test = '11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124'

ranges = input_test.split(',')
invalid_ids = []

ranges.each do | range |
  first_id, last_id = range.split('-').map(&:to_i)

  (first_id..last_id).each do |id|
    digits = id.digits
    digits_count = digits.count

    if digits_count == 1
      next
    else
      middle = digits_count.even? ? (digits_count / 2) : (digits_count / 3)
      i = 1

      while(i <= middle)
        list = digits.each_slice(i)

          if list.uniq.count == 1
            invalid_ids << id 
            break
          end
          
        digits_count.even? ? i += 1 : i += 2
      end
    end
  end
end

p "Sum of invalid ids: #{invalid_ids.sum}"
