require "./condamnation"
require "date"

class Jugement

	attr_accessor :date_caractere_definitif, :condamnation

	CAS = "CAS"
	CONTRADICTOIRE = "CONTRADICTOIRE"

	def initialize fait, date_du_jugement, nature_du_jugement = CONTRADICTOIRE, date_notifiee_a_personne = nil
  		@fait = fait
	    @date_du_jugement = DateTime.parse(date_du_jugement)
	    @nature_du_jugement = nature_du_jugement
	    case nature_du_jugement
  	    when CAS
	            @date_notifiee_a_personne = DateTime.parse(date_notifiee_a_personne)
		    	@date_caractere_definitif = @date_notifiee_a_personne + 11
	    	when CONTRADICTOIRE
	    		@date_caractere_definitif = @date_du_jugement + 20
	   	end
	   	@condamnation = Condamnation.new(@fait, @date_caractere_definitif)
	end

end
