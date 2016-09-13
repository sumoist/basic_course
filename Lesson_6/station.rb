class Station
  include Validator

  attr_reader :name

 @@stations = []

  NAME_FORMAT = /^[а-яёa-z0-9]+$/i

  def initialize(name)
    @name = name
    @trains = Hash.new { |hash, key| hash[key] = [] }
    @@stations << self
    validate!
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

  private

  def validate!
    raise 'Название станции не может быть пустым' if name.nil?
    raise 'Название станции должно содержать не меньше 4 символов' if name.length < 4
    raise 'Использован неправильный формат названия' if name !~ NAME_FORMAT
    true
  end
end