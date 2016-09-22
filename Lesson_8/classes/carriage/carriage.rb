# carriage
class Carriage
  include Company
  include Validator

  attr_reader :type, :number

  def initialize(type)
    @type = type
    @number = rand(1..9999)
    validate!
  end

  private

  def validate!
    raise 'Неверный тип вагона' unless [CargoTrain::TYPE, PassengerTrain::TYPE].include? type.to_sym
    true
  end
end
