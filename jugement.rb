require "condamnation.rb"
require "parsedate"    # A versatile date/time parsing library
include ParseDate      # Include parsedate() as a global function

class Jugement

	attr_accessor :date_caractere_definitif, :condamnation

	CAS = "CAS"
	CONTRADICTOIRE = "CONTRADICTOIRE"

	def initialize fait, date_du_jugement, nature_du_jugement = CONTRADICTOIRE, date_notifiee_a_personne = nil
  		@fait = fait
	    @date_du_jugement = parseDate(date_du_jugement)
	    @nature_du_jugement = nature_du_jugement
	    @date_notifiee_a_personne = parseDate(date_notifiee_a_personne)
	    case nature_du_jugement
  	    when CAS
		    	@date_caractere_definitif = date_notifiee_a_personne + 11
	    	when CONTRADICTOIRE
	    		@date_caractere_definitif = date_du_jugement + 20
	   	end
	   	@condamnation = Condamnation.new(@fait, @date_caractere_definitif)
	end

end