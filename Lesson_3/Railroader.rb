class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @type1= []  #G - грузовой
    @type2= []  #P - пассажирский
  end

  def train_in(train)
    if @type1.include?(train) || @type2.include?(train)
      puts "Поезд с таким номером уже на станции!"
    elsif train.type == "G"
      @type1 << train
      puts "Прибыл грузовой поезд #{train.number} на станцию #{name}"
    else
      @type2 << train
      puts "Прибыл пассажирский поезд #{train.number} на станцию #{name}"
    end
  end

  def train_out(train)
    puts "Отправлен поезд #{train.number} со станции #{name}" if @type1.delete(train) || @type2.delete(train)
  end

  def train_list(type="All")
    if type == "G"
      puts "Список грузовых поездов: #{@type1}"
    elsif type == "P"
      puts "Список пассажирских поездов: #{@type2}"
    else
      puts "Полный список поездов на станции #{@type1}, #{@type2}"
    end
  end


end

class Route
  attr_reader :route

  def initialize (from, to)
    @route = [from, to]
  end

  def add_station(station)
    @route.insert(-2,station)
  end

  def del_station(station)
    @route.delete(station) unless [@route.first, @route.last].include?(station)
  end

  def all_route
    puts "Полный маршрут с указанием станций: #{route}"
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
    @route = route.route
    @current_station = @route.first
    puts "Поезд находится на станции #{@current_station} и следует марщруту #{@route.first} - #{@route.last}"
  end

  def next_station
    @next_station = @route[@route.index(@current_station) + 1] if @current_station != @route.last
  end

  def prev_station
    @prev_station = @route[@route.index(@current_station) - 1] if @current_station != @route.first
  end

  def print_train_position
    if prev_station.nil? == true
      puts "Поезд находится на начальной станции"
    else
      puts "Предыдущая станция #{@prev_station}"
    end

    puts "Текущая станция #{@current_station}"

    if next_station.nil? == true
      puts "Поезд находится на конечной станции"
    else
      puts "Следующая станция станция #{@next_station}"
    end
  end

  def go_next_station
    @current_station = @next_station
  end

  def go_prev_station
    @current_station = @prev_station
  end
end