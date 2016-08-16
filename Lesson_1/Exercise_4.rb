puts "Введите коэффициент A"
a = gets.chomp.to_f
puts "Введите коэффициент B"
b = gets.chomp.to_f
puts "Введите коэффициент C"
c = gets.chomp.to_f

discriminant = b**2 - 4 * a * c

if discriminant < 0
  puts "Дискриминант = #{discriminant}, корней нет"
else
  x1 = (-b + Math.sqrt(discriminant)) / (2 * a)
  if discriminant > 0
    x2 = (-b - Math.sqrt(discriminant)) / (2 * a)
    puts "Дискриминант = #{discriminant}, корень №1 = #{x1}, корень №2 =  #{x2}"
  else
    puts "Дискриминант = #{discriminant}, корень №1 = корень №2 = #{x1}"
  end
end
