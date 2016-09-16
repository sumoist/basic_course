class Route
  include Validator

  attr_reader :route

  def initialize (from, to)
    @route = [from, to]
    puts from
    puts to
    validate!
  end

  def add_station(station)
    @route.insert(-2,station)
  end

  def del_station(station)
    @route.delete(station) unless [@route.first, @route.last].include?(station)
  end

  def print_all_route
    puts "Полный маршрут с указанием станций: #{@route}"
  end

  private

  def validate!
    raise "Название станции не может быть пустым" if @route.include?("")
    true
  end
end