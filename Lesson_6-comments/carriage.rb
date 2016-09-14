class Carriage
  include Company
  include Validator

  attr_reader :type

  def initialize(type)
    @type = type
    validate!
  end

  def validate!
    raise 'Неправильный тип вагона' unless [CargoTrain::TYPE, PassengerTrain::TYPE].include? type.to_sym
    true
  end
end