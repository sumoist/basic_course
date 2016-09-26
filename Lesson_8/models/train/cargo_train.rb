# cargo train
class CargoTrain < Train
  TYPE = :cargo

  def initialize(number)
    @type = self.class.type
    super
  end

  def self.type
    TYPE
  end
end
