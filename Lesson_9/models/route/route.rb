# train routes
class Route
  include Validation

  attr_reader :route

  validate :route, :presence
  validate :type_class, :type, 'Route'

  def initialize(from, to)
    @type_class = self.class.to_s
    @route = [from, to]
    validate!
  end

  def add_station(station)
    @route.insert(-2, station)
  end

  def del_station(station)
    @route.delete(station) unless [@route.first, @route.last].include?(station)
  end

  def print_all_route
    puts "Полный маршрут с указанием станций: #{@route}"
  end

  #  private

  #  def validate!
  #    raise 'Название станции не может быть пустым' if @route.include?('')
  #    true
  #  end
end
