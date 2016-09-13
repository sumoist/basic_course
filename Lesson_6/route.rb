class Route
  include Validator

  attr_reader :route

  def initialize (from, to)
    @route = [from, to]
    validate!
  end

  def add_station(station)
    @route.insert(-2,station)
  end

  def del_station(station)
    @route.delete(station) unless [@route.first, @route.last].include?(station)
  end

  def all_route
    puts "Полный маршрут с указанием станций: #{@route}"
  end

  private

  def validate!
#    raise "Название вагона не может быть пустым" if carriage_number.nil?
#    raise "Название вагона должно содержать не меньше 6 символов" if carriage_number.length < 6
#    raise "Использован неправильный формат" if carriage_number !~ NUMBER_FORMAT
#    true
  end
end