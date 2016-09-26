# railway stations
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
    end
  end

  def train_out(train)
    @trains[train.type].delete(train)
  end

  def train_list(type = nil)
    if type.nil?
      puts "Поезда на станции #{@name}: #{@trains}"
    else
      puts "Поезда указанного типа на станции #{@name}: #{@trains[type]}"
    end
  end

  def self.all
    @@stations
  end

  def each_train(&block)
    @trains.values.flatten.each(&block)
  end

  private

  def validate!
    raise 'Название станции не может быть пустым' if name.nil?
    raise 'Название станции укажите не меньше 4 символов' if name.length < 4
    raise 'Использован неправильный формат названия' if name !~ NAME_FORMAT
    true
  end
end
