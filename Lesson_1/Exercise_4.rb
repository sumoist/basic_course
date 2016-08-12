puts "Введите коэффициент A"
a = gets.chomp.to_f
puts "Введите коэффициент B"
b = gets.chomp.to_f
puts "Введите коэффициент C"
c = gets.chomp.to_f

discriminant = b**2 - 4 * a * c

if discriminant < 0
  puts "Дискриминант равен #{discriminant}, корней нет"
elsif discriminant > 0
  x1 = (-b + Math.sqrt(discriminant)) / (2 * a)
  x2 = (-b - Math.sqrt(discriminant)) / (2 * a)
  puts "Дискриминант равен #{discriminant}, корень #{x1}, корень #{x2}"
else
  x3 = (-b) / (2 * a)
  puts "Дискриминант равен #{discriminant}, корень #{x3}"
end


