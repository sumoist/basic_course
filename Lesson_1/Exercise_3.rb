puts "Введите длину стороны №1 треугольника"
param_one = gets.chomp.to_f
puts "Введите длину стороны №2 треугольника"
param_two = gets.chomp.to_f
puts "Введите длину стороны №3 треугольника"
param_three = gets.chomp.to_f

# определяем какое значение из введенных данных гипотенуза
if param_one > param_two && param_one > param_three
  longest_side = param_one
  side_two = param_two
  side_three = param_three
  puts "Сторона №1 - гипотенуза, стороны №2 и №3 - катеты"
elsif param_two > param_one && param_two> param_three
  longest_side = param_two
  side_two = param_one
  side_three = param_three
  puts "Сторона №2 - гипотенуза, стороны №1 и №3 - катеты"
else
  longest_side = param_three
  side_two = param_one
  side_three = param_two
  puts "Сторона №3 - гипотенуза, стороны №1 и №2 - катеты"
end

#проверяем на прямоугольность
if longest_side**2 == side_two**2 + side_three**2
  puts "Это прямоугольный треугольник, т.к. выполняется равенство, согласно теоремы Пифагора: #{longest_side**2} = #{side_two**2} + #{side_three**2}"
else
  puts "Треугольник не прямоугольный!"
end

#проверяем на равнобедренность
if side_two == side_three
  puts "Треугольник равнобедренный"
else
  puts "Треуголиник не равнобедренный!"
end