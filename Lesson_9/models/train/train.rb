# trains
class Train
  include Accessors
  include Company
  include Validation

  attr_reader :number, :carriages, :speed, :type

  @@trains = {}

  TRAIN_NUMBER = /^[а-яёa-z0-9]{3}-?[а-яёa-z0-9]{2}$/i

  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER
  validate :type_class, :type, 'Train'

  def initialize(number)
    @type_class = self.class
    @number = number
    @carriages = []
    @speed = 0
    @@trains[@type] = { number => self }
    validate!
  end

  def speed_up(speed)
    @speed += speed
  end

  def speed_down(speed)
    @speed -= speed
    @speed = 0 if @speed < 0
  end

  def add_carriage(carriage)
    @carriages << carriage if @type == carriage.type && @speed.zero?
  end

  def del_carriage
    @carriages.pop if @speed.zero?
  end

  def take_route(route)
    @route = route.route
    @current_station = @route.first
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
    if next_station.nil?
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

  def each_carriage(&block)
    @carriages.each(&block)
  end

  def to_s
    "Поезд номер:#{number}, тип:#{type}, кол-во вагонов:#{carriages.size}"
  end

  private

  def next_station
    @next_station = @route[@route.index(@current_station) + 1] if @current_station != @route.last
  end

  def prev_station
    @prev_station = @route[@route.index(@current_station) - 1] if @current_station != @route.first
  end

  class << self
    def find(number)
      return unless respond_to?(:type)
      @@trains[type][number]
    end
  end

  def validate!
    raise 'Номер поезда не может быть пустым' if number.nil?
    raise 'Формат номера должен быть ХХХ-ХХ или ХХХХХ' if number !~ TRAIN_NUMBER
    true
  end
end
