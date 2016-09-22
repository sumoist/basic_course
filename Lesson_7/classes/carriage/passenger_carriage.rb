class PassengerCarriage < Carriage

  attr_reader :used_seat

  def initialize(seats)
    @seats = seats
    @used_seat = 0
    super (:passenger)
  end

  def take_seat
    @used_seat += 1 if @used_seat < @seats
  end

  def free_seat
    @free_seat = @seats - @used_seat
  end

  def to_s
    "Вагон номер:#{number}, тип:#{type}, свободно:#{free_seat}"
  end
end