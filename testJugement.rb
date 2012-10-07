#!/usr/bin/env ruby

require "jugement.rb"
require "test/unit" 
require "fait.rb"
require "date"


class TestJugement < Test::Unit::TestCase

	def test_calcul_date_caractere_definitif_pour_jugement_CAS
		date_du_jugement = "2010-8-5"
		date_notifiee_a_personne = "2012-5-5" 

	  jugement = Jugement.new(Fait.new(Date.new(2010, 5, 5)), date_du_jugement, Jugement::CAS, date_notifiee_a_personne)
	    
	  assert_equal Date.new(2012, 5, 16), jugement.date_caractere_definitif
 	end

	def test_calcul_date_caractere_definitif_pour_jugement_CONTRADICTOIRE
		date_du_jugement = "2012-5-6"
		
		jugement = Jugement.new(Fait.new(Date.new(2011, 1, 8)), date_du_jugement)
		
		assert_equal Date.new(2012, 5, 26), jugement.date_caractere_definitif
	end

end