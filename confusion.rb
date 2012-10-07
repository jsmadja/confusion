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

end
