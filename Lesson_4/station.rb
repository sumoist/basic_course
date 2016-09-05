class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @cargo = []       #C - грузовой
    @passenger = []   #P - пассажирский
    @trains = @cargo + @passenger
  end

  def train_in(train)

    if @trains.include?(train)
      puts 'Поезд с таким номером уже на станции!'
    elsif train.type == 'C'
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
    if type == 'C'
      puts "Список грузовых поездов: #{@cargo}"
    elsif type == 'P'
      puts "Список пассажирских поездов: #{@passenger}"
    else
      puts "Полный список поездов на станции #{@cargo}, #{@passenger}"
    end
  end

end