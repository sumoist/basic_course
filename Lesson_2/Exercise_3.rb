arr = Array.new

first_num = 1
second_num = 1
arr.push(first_num, second_num)
next_num = 2

while next_num < 100 do
  result = first_num + second_num
  first_num = second_num
  second_num = result
  next_num += 1

  if result < 100
    arr.push(result)
  end
end

puts "#{arr}"