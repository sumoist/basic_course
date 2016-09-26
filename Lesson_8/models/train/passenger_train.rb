# passenger train
class PassengerTrain < Train
  TYPE = :passenger

  def initialize(number)
    @type = self.class.type
    super
  end

  def self.type
    TYPE
  end
end
