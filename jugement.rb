class Jugement

	attr_accessor :date_caractere_definitif, :peine, :fait

	CAS = "CAS"
	CONTRADICTOIRE = "CONTRADICTOIRE"

	def initialize fait, date_du_jugement, nature_du_jugement, peine, date_notifiee_a_personne = nil
  		@fait = fait
  	    @date_du_jugement = date_du_jugement
  	    @nature_du_jugement = nature_du_jugement
  	    @date_notifiee_a_personne = date_notifiee_a_personne
  	    @peine = peine
  	    case nature_du_jugement
	  	    when CAS
  		    	@date_caractere_definitif = date_notifiee_a_personne + 11
  	    	when CONTRADICTOIRE
  	    		@date_caractere_definitif = date_du_jugement + 20
  	   	end
	end

end