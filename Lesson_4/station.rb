class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @cargo = []
    @passenger = []
    @trains = @cargo + @passenger
  end

  def train_in(train)
    if @trains.include?(train)
      puts 'Поезд с таким номером уже на станции!'
    elsif train.type == 'cargo'
      @cargo << train
      puts "Прибыл грузовой поезд #{train.number} на станцию #{name}"
    else
      @passenger << train
      puts "Прибыл пассажирский поезд #{train.number} на станцию #{name}"
    end
  end

  def train_out(train)
    puts "Отправлен поезд #{train.number} со станции #{name}" if @cargo.delete(train) || @passenger.delete(train)
  end

  def train_list(type=nil)
    if type == 'cargo'
      puts "Список грузовых поездов: #{@cargo}"
    elsif type == 'passenger'
      puts "Список пассажирских поездов: #{@passenger}"
    else
      puts "Полный список поездов на станции #{@cargo}, #{@passenger}"
    end
  end
end