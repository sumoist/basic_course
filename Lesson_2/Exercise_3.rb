arr = [0,1,1]

loop do
  result = arr[-2] + arr[-1]
  break if result > 100
  arr.push(result)
end

puts "#{arr}"