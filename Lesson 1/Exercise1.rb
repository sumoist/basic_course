puts "Как тебя зовут?"
name = gets.chomp
puts "Привет, #{name}, какой твой рост?"
growth = gets.chomp
perfect_weight = growth.to_i - 110
if perfect_weight <= 0
  puts "#{name}, твой вес уже оптимальный"
  else puts "#{name}, твой вес должен быть #{perfect_weight}"
end
