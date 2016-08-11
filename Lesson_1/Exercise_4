puts "Введите коэффициент A"
a = gets.chomp
puts "Введите коэффициент B"
b = gets.chomp
puts "Введите коэффициент C"
c = gets.chomp

D = b.to_i**2 - 4*a.to_i*c.to_i

if D < 0
  puts "Дискриминант равен #{D}, корней нет"
elsif D > 0
  puts "Дискриминант равен #{D}, корень x1 = #{(-b.to_i+Math.sqrt(D))/(2*a.to_i)}, корень x2 = #{(-b.to_i-Math.sqrt(D))/(2*a.to_i)}"
else puts "Дискриминант равен #{D}, корень x1 = x2 = #{(-b.to_i)/(2*a.to_i)}"
end


