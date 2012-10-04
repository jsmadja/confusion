require "fait.rb"
require "peine.rb"

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
		jugementA = @jugements[0]
		jugementB = @jugements[1]

		days_to_go = jugementA.date_caractere_definitif - jugementB.fait.date_des_faits
		days_to_go > 0
	end

	def peine_sans_demande
	  @jugements.inject(Peine.new(0)) { |peine_cumul, jugement|
	    peine_cumul + jugement.peine
	  }
	end

	def peine_avec_demande
	  jugement_avec_peine_maximale.peine
	end

	def jugement_avec_peine_maximale
	  @jugements.max_by { |jugement| jugement.peine.duree}
	end

end