class CargoCarriage < Carriage

  attr_reader :used_bulk, :free_bulk

  def initialize(bulk)
    @bulk = bulk
    @used_bulk = 0
    super(:cargo)
  end

  def take_bulk(bulk)
    @used_bulk += bulk if @used_bulk < @bulk
    @used_bulk = @bulk if @used_bulk > @bulk
  end

  def free_bulk
    @free_bulk = @bulk - @used_bulk
  end
end
