require "date"

class Fait
  
  attr_accessor :date_des_faits, :description

  def initialize date_des_faits, description = nil
    @date_des_faits = DateTime.parse(date_des_faits)
    @description = description
  end
 
end