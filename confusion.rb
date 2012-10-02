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
	  peine = Peine.new(0)
	  @jugements.each { |jugement| 
	  	peine += jugement.peine 
	  }
	  peine
	end

	def peine_avec_demande
	  jugement_avec_peine_maximale(*@jugements).peine
	end

	def jugement_avec_peine_maximale(first, *rest)
	  jugementAvecPeineMaximale = first
	  rest.each { |jugement| 
	  	jugementAvecPeineMaximale = jugement if jugement.peine.duree > jugementAvecPeineMaximale.peine.duree 
	  }
	  jugementAvecPeineMaximale
	end

end