class Fait
  
  attr_accessor :date_des_faits, :description

  def initialize date_des_faits, description = nil
  	    @date_des_faits = date_des_faits
  	    @description = description
  end
 
end