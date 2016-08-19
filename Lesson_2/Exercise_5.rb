year = (0..9999).to_a
calendar = {1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}

begin
  puts "Введите год от 0 до 9999"
  input_year = gets.chomp.to_i
end until year.include?(input_year)

if ((input_year % 4) == 0 && (input_year % 100) != 0) || (input_year % 400 == 0)
  calendar[2] = 29
end

begin
  puts "Введите месяц от 1 до 12"
  input_month = gets.chomp.to_i
end until calendar.keys.include?(input_month)

begin
  puts "Введите день, учитывая что в месяце 30 или 31 день. В феврале 28 или 29 дней"
  input_day = gets.chomp.to_i
end until (1..calendar[input_month]).include?(input_day)

period = 0
calendar.each do |month, day|
  if month == input_month
    period += input_day
    break
  else
    period += day
  end
end

puts "От начала года #{period} дней"