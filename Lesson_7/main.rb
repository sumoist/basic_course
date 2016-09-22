#modules
require_relative 'modules/company'
require_relative 'modules/validator'
#classes
require_relative 'classes/route/route'
require_relative 'classes/station/station'
require_relative 'classes/train/train'
require_relative 'classes/carriage/carriage'
#subclasses
require_relative 'classes/train/cargo_train'
require_relative 'classes/train/passenger_train'
require_relative 'classes/carriage/cargo_carriage'
require_relative 'classes/carriage/passenger_carriage'

=begin
begin
  puts 'Укажите номер поезда'
  number = gets.chomp.to_s
  puts 'Выберите тип поезда: 1-грузовой; 2-пассажирский'
  type = gets.chomp.to_i
  train_class = case type
  when 1
    CargoTrain
  when 2
    PassengerTrain
  else
    raise 'Указано неверное значение типа'
  end

  train = train_class.new(number)

rescue RuntimeError => e
  puts "Ошибка: #{e}"
  retry
end

puts "Создан поезд #{train} с номером #{number}"
=end

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
      puts "  #{train.to_s}"
      train.each_carriage {|carriage| puts "    #{carriage}"}
    end
  end
end