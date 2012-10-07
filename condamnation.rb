require "./fait"
require "date"

class Condamnation

	attr_accessor :fait

	def initialize fait, date_caractere_definitif
		@fait = fait
		@date_caractere_definitif = date_caractere_definitif
	end

	def est_definitive_avec condamnation
		days_to_go = @date_caractere_definitif - condamnation.fait.date_des_faits
		definitive = days_to_go < 0
	end

	def est_pas_definitive_avec condamnation
		!est_definitive_avec condamnation
	end

end
