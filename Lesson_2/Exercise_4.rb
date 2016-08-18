vowels_hash = Hash.new

alphabets = ('а'..'я').to_a
vowels = %w(а е ё и о у ы э ю я)

alphabets.each do |letters|
  if vowels.include? letters
    vowels_hash[letters] = alphabets.index(letters) + 1
  end
end

puts "#{vowels_hash}"