year = (0..9999).to_a
month = {1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}

puts "Введите год от 0 до 9999"
input_year = gets.chomp.to_i

while !year.include?(input_year) do
  puts "Указан неправильно год! Необходимо указать значение от 0 до 9999"
  input_year = gets.chomp.to_i
end

if ((input_year % 4) == 0 && (input_year % 100) != 0) || (input_year % 400 == 0)
  month ["02"] = 29
end

puts "Введите месяц от 1 до 12"
input_month = gets.chomp.to_i

while !month.keys.include?(input_month) do
  puts "Указан неправильно месяц! Необходимо указать значение от 1 до 12"
  input_month = gets.chomp.to_i
end

puts "Введите день, учитывая что в месяце 30 или 31 день. В феврале 28 или 29 дней"
input_day = gets.chomp.to_i

while input_day < 1 || input_day > month[input_month] do
  puts "Указан неправильно день! Необходимо указать значение, соответствующее кол-ву дней в этом месяце (от 1 до 28/29/30/31)"
  input_day = gets.chomp.to_i
end

#puts "#{input_day}.#{input_month}.#{input_year}"

period = 0
month.each do |key, value|
  if key == input_month
    period += input_day
    break
  else
    period += value
  end
end

puts "От начала года #{period} дней"