class PassengerTrain < Train

  def initialize(number)
    super
    @type = :passenger
    @@trains[type] = {number => self}
  end
end