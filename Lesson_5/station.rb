class Station
  attr_reader :name

 @@stations = []

  def initialize(name)
    @name = name
    @trains = Hash.new { |hash, key| hash[key] = [] }
    @@stations << self
  end

  def train_in(train)
    if @trains[train.type].include?(train)
      puts 'Этот поезд уже на станции!'
    else
      @trains[train.type] << train
      puts "Прибыл поезд #{train.number} на станцию #{name}"
    end
  end

  def train_out(train)
    puts "Отправлен поезд #{train.number} со станции #{name}" if @trains[train.type].delete(train)
  end

  def train_list(type=nil)
    if type.nil?
      puts "Полный список поездов на станции #{@trains}"
    else
      puts "Список поездов указанного типа: #{@trains[type]}"
    end
  end

  def self.all
    @@stations
  end
end