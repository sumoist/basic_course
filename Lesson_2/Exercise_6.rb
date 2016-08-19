sum = 0
purchase = {}
price_dep_count = {}

loop do
  puts "Название товара:"
  name = gets.chomp
  if name == "стоп"
    price_dep_count.each do |name,sum|
      puts "Итого за товар: #{name} - #{sum}"
    end
    puts "Общая сумма: #{sum}"
    puts "Покупки в хеше: #{purchase}"
    break
  else
    puts "Цена за единицу:"
    price = gets.chomp.to_f
    puts "Количество товара:"
    count = gets.chomp.to_f

    purchase[name] = {price => count}
    sum += price * count
    price_dep_count[name] = price * count

  end
end
