class CargoTrain < Train

  def initialize(number)
    super
    @type = :cargo
    @@trains[type] = {number => self}
  end
end