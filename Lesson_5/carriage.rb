class Carriage
  require_relative 'modules'
  include Company

  attr_reader :type

  def initialize(type)
    @type = type
  end
end