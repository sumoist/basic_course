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