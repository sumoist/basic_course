#modules
require_relative 'company'
require_relative 'validator'
#classes
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'carriage'
#subclasses
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'


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