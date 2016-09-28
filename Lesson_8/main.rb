# modules
require_relative 'modules/company'
require_relative 'modules/validation'
require_relative 'modules/acessors'
# classes
require_relative 'models/route/route'
require_relative 'models/station/station'
require_relative 'models/train/train'
require_relative 'models/carriage/carriage'
# subclasses
require_relative 'models/train/cargo_train'
require_relative 'models/train/passenger_train'
require_relative 'models/carriage/cargo_carriage'
require_relative 'models/carriage/passenger_carriage'

# begin
#   puts 'Enter train number'
#   number = gets.chomp.to_s
#   puts 'Enter train type: 1-cargo; 2-passenger'
#   type = gets.chomp.to_i
#   train_class = case type
#   when 1
#     CargoTrain
#   when 2
#     PassengerTrain
#   else
#     raise 'Wrong train type!'
#   end
#
#   train = train_class.new(number)
#
# rescue RuntimeError => e
#   puts "Error: #{e}"
#   retry
# end
#
# puts "The train #{train} was created with number #{number}"

station1 = Station.new('Station1')
station2 = Station.new('Station2')
big_train1 = CargoTrain.new('big01')
big_train2 = CargoTrain.new('big02')
inter_city1 = PassengerTrain.new('intr1')
inter_city2 = PassengerTrain.new('intr2')
outer_city1 = PassengerTrain.new('outr1')
outer_city2 = PassengerTrain.new('outr2')
cargo_carriage1 = CargoCarriage.new(10)
cargo_carriage2 = CargoCarriage.new(15)
cargo_carriage3 = CargoCarriage.new(20)
cargo_carriage4 = CargoCarriage.new(25)
passenger_carriage1 = PassengerCarriage.new(30)
passenger_carriage2 = PassengerCarriage.new(35)
passenger_carriage3 = PassengerCarriage.new(40)
passenger_carriage4 = PassengerCarriage.new(45)
passenger_carriage5 = PassengerCarriage.new(50)
passenger_carriage6 = PassengerCarriage.new(60)
passenger_carriage7 = PassengerCarriage.new(65)
passenger_carriage8 = PassengerCarriage.new(70)
big_train1.add_carriage(cargo_carriage1)
big_train1.add_carriage(cargo_carriage2)
big_train2.add_carriage(cargo_carriage3)
big_train2.add_carriage(cargo_carriage4)
inter_city1.add_carriage(passenger_carriage1)
inter_city1.add_carriage(passenger_carriage2)
inter_city2.add_carriage(passenger_carriage3)
inter_city2.add_carriage(passenger_carriage4)
outer_city1.add_carriage(passenger_carriage5)
outer_city1.add_carriage(passenger_carriage6)
outer_city2.add_carriage(passenger_carriage7)
outer_city2.add_carriage(passenger_carriage8)
station1.train_in(big_train1)
station1.train_in(inter_city1)
station1.train_in(outer_city1)
station2.train_in(big_train2)
station2.train_in(inter_city2)
station2.train_in(outer_city2)

begin
  Station.all.each do |station|
    puts "На станции #{station.name} находится:"
    station.each_train do |train|
      puts "  #{train}"
      train.each_carriage { |carriage| puts "    #{carriage}" }
    end
  end
end