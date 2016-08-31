class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def train_in(train)
    @trains << train
    puts "Прибыл поезд #{train.number} на станцию #{name}"
  end

  def train_out(train)
    puts "Отправлен поезд #{train.number} со станции #{name}" if @trains.delete(train)
  end

  def list_trains_by_type(type)
    trains_to_list = []
    @trains.each do |train|
      trains_to_list << train if train.type == type
    end
    puts "Список поездов по типу(#{type}) - #{trains_to_list.length}:"
    trains_to_list.each { |train| puts "#{train.number}"}
  end
end


class Route
  attr_reader :set_route

  def initialize (from, to)
    @set_route = [from, to]
  end

  def add_to_route(station)
    @set_route.insert(-2,station)
  end

  def del_from_route(station)
    @set_route.delete(station) if station != @set_route.first && station != @set_route.last
  end

  def all_route
    puts "Полный маршрут с указанием станций: #{set_route}"
  end
end

class Train
  attr_reader :number, :type, :carriages, :speed

  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
  end

  def speed_up(speed)
    @speed += speed
  end

  def speed_down(speed)
    @speed -= speed
    @speed = 0 if @speed < 0
  end

  def add_carriage
    @carriages += 1 if @speed == 0
  end

  def del_carriage
    @carriages -= 1 if @speed == 0 && @carriages > 0
  end

  def take_route(route)
    @route = route.set_route
    @current_station = @route.first
    puts "Поезд находится на станции #{@current_station} и следует марщруту #{@route.first} - #{@route.last}"
  end

  def print_next_station
    @next_station = route[route.index(current_station) + 1] if current_station != @route.last
    puts @next_station
  end

  def print_prev_station
    @prev_station = route[route.index(current_station) - 1] if current_station != @route.first
    puts @prev_station
  end

  def go_next_station
    @next_station = route[route.index(current_station) + 1] if current_station != @route.last
    @current_station = @next_station
  end

  def go_prev_station
    @prev_station = route[route.index(current_station) - 1] if current_station != @route.first
    @current_station = @prev_station
  end
end