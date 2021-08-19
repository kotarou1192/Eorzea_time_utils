module EorzeaWeather
  module_function

  def weather_freqency()
    unix_seconds = Time.now.to_i

    bell = unix_seconds / 175
    increment = (bell + 8 - (bell % 8)) % 24

    total_days = unix_seconds / 4200

    calc_base = total_days * 100 + increment

    step1 = (calc_base << 11) ^ calc_base
    step1 = to_int32(step1)

    step2 = (step1 >> 8) ^ step1
    step2 = to_int32(step2)

    step2 % 100
  end

  def to_int32(num)
    diet_number = num
    loop do
      bit = diet_number.to_s(2)
      break if bit.size <= 32

      bit = bit[1..(bit.size - 1)]
      diet_number = bit.to_i(2)
    end
    diet_number
  end
end
