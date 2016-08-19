arr = [0,1,1]

first = 1
second = 1
seq = 2

loop do
  result = first + second
  first = second
  second = result
  seq += 1

  if result < 100
    arr.push(result)
  else
    break
  end
end

puts "#{arr}"