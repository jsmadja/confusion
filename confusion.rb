require 'cairo'
require "./fait"

class Confusion

	def initialize 
		@jugements = []
	end
  
	def +(jugement)
		@jugements << jugement
	end

	def nombre_de_faits
		@jugements.count
	end

	def possible
		possible = false
		jugementPrecedent = nil
		for jugement in @jugements 
		  if (jugementPrecedent)
		  	if(jugementPrecedent.condamnation.est_pas_definitive_avec(jugement.condamnation))
		  		possible = true	
		  	end
		  end
		  jugementPrecedent = jugement
		end
		possible
	end

	def etude
		audit = []
	  	x = 0               
		for x in 0..@jugements.count do      
		  jugement = @jugements[x]
			y = x + 1               
			while y < @jugements.count do
				jugementSuivant = @jugements[y]
				if (jugement.condamnation.est_definitive_avec(jugementSuivant.condamnation))
					audit << "#{jugement.condamnation.fait.description} est definitif avec #{jugementSuivant.condamnation.fait.description}"
				else
					audit << "#{jugement.condamnation.fait.description} n'est pas definitif avec #{jugementSuivant.condamnation.fait.description}"
				end
				y = y + 1
			end       
		end  
		audit
	end	

	def dessiner fichier_destination
		dates =  @jugements.map { |jugement| 
			jugement.condamnation.fait.date_des_faits
		}
		min_date = dates.min
		
		dates =  @jugements.map { |jugement| 
			jugement.date_caractere_definitif
		}
		max_date = dates.max
		
		w = max_date - min_date
		h = 300
		bg = [1.0,1.0,1.0, 1]
		surface = Cairo::ImageSurface.new(w,h)
		cr = Cairo::Context.new(surface)

		@jugements.each do |jugement|
 			jugement.dessiner cr, w, h, min_date
 		end 

		cr.target.write_to_png(fichier_destination)
	end	

end
