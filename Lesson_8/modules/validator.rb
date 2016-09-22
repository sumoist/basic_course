# validate input values
module Validator
  def valid?
    validate!
  rescue
    false
  end
end
