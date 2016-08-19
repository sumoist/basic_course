vowels_hash = {}

alphabets = ('а'..'я').to_a
vowels = %w(а е и о у ы э ю я)

vowels.each do |letter|
  vowels_hash[letter] = alphabets.index(letter) + 1
end

puts "#{vowels_hash}"