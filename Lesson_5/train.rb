class Train
  require_relative 'modules'
  include Company

  attr_reader :number, :type, :carriages, :speed

  @@trains = {}

  def initialize(number, type)
    @number = number
    @type = type
    @carriages = []
    @speed = 0
    @@trains[number] = self
  end

  def speed_up(speed)
    @speed += speed
  end

  def speed_down(speed)
    @speed -= speed
    @speed = 0 if @speed < 0
  end

  def add_carriage(carriage)
    @carriages << carriage if @type == carriage.type && @speed == 0
  end

  def del_carriage
    @carriages.pop if @speed == 0
  end

  def take_route(route)
    @route = route.route
    @current_station = @route.first
    puts "Поезд находится на станции #{@current_station} и следует марщруту #{@route.first} - #{@route.last}"
  end

  def print_prev_station
    if prev_station.nil? == true
      puts 'Поезд находится на начальной станции'
    else
      puts "Предыдущая станция #{prev_station}"
    end
  end

  def print_current_station
    puts "Текущая станция #{@current_station}"
  end

  def print_next_station
    if next_station.nil? == true
      puts 'Поезд находится на конечной станции'
    else
      puts "Следующая станция станция #{next_station}"
    end
  end

  def go_next_station
    @current_station = @next_station
  end

  def go_prev_station
    @current_station = @prev_station
  end

  private

  def next_station
    @next_station = @route[@route.index(@current_station) + 1] if @current_station != @route.last
  end

  def prev_station
    @prev_station = @route[@route.index(@current_station) - 1] if @current_station != @route.first
  end

  def self.find(number)
    @@trains[number]
  end

end
