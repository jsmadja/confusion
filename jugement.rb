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

	def dessiner cr, width, height, reference_date
		couleur_aleatoire cr
		
		xDateJugement =  @date_du_jugement - @fait.date_des_faits
		xDateCaractereDefinitif = @date_caractere_definitif - @fait.date_des_faits
		
		# /
		ligne cr, (@fait.date_des_faits - reference_date), 0, xDateJugement, height, height
		
		# \
		ligne cr, xDateJugement, height, xDateCaractereDefinitif, 0, height
	
	end

	def couleur_aleatoire cr
		cr.set_source_rgb(rand, rand, rand)
	end

	def ligne cr, x1, y1, x2, y2, height
		puts "ligne (#{x1},#{y1}) - (#{x2}, #{y2})"
		cr.set_line_width(1)
		cr.move_to(x1, height - y1)
		cr.line_to(x2, height - y2)
		cr.stroke()
	end

end
