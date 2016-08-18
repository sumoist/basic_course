name = 0
sum = 0
purchase = Hash.new
price_dep_count = Array.new

while name != "стоп" do
  puts "Название товара:"
  name = gets.chomp
  if name == "стоп"
    price_dep_count.each do |x|
      sum += x
    end

    puts "Покупки в хеше: #{purchase}"
    puts "Итоговая сумма #{sum}"
    break
  else
    puts "Цена за единицу:"
    price = gets.chomp.to_f
    puts "Количество товара:"
    count = gets.chomp.to_f

    purchase[name] = {price => count}
    price_dep_count.push(price * count)

  end
end

