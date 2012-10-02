#!/usr/bin/env ruby

require "test/unit" 

require "peine.rb"
require "fait.rb"
require "confusion.rb"
require "date"
require "jugement.rb"

class TestConfusion < Test::Unit::TestCase
  
  def test_calcul_sans_demande_de_confusion_de_peine
  	date_du_jugement = Date.new(2010, 8, 5)
	  date_notifiee_a_personne = Date.new(2012, 5, 5) 
    faitA = Fait.new(Date.new(2010, 5, 5))
    jugementA = Jugement.new(faitA, date_du_jugement, Jugement::CAS, Peine.new(5), date_notifiee_a_personne)

    date_du_jugement = Date.new(2012, 5, 6)
    faitB = Fait.new(Date.new(2011, 1, 8))
    jugementB = Jugement.new(faitB, date_du_jugement, Jugement::CONTRADICTOIRE, Peine.new(6))

    confusion = Confusion.new()
    confusion + jugementA
    confusion + jugementB

    assert_equal 2, confusion.nombre_de_faits
    assert_equal true, confusion.possible
    assert_equal 11, confusion.peine_sans_demande.duree
  end

  def test_calcul_avec_demande_de_confusion_de_2_peines
    date_du_jugement = Date.new(2010, 8, 5)
    date_notifiee_a_personne = Date.new(2012, 5, 5) 
    jugementA = Jugement.new(
        Fait.new(Date.new(2010, 5, 5)), 
        date_du_jugement, 
        Jugement::CAS, 
        Peine.new(5), 
        date_notifiee_a_personne)

    date_du_jugement = Date.new(2012, 5, 6)
    jugementB = Jugement.new(
        Fait.new(Date.new(2011, 1, 8)), 
        date_du_jugement, 
        Jugement::CONTRADICTOIRE, 
        Peine.new(6))

    confusion = Confusion.new()
    confusion + jugementA
    confusion + jugementB

    assert_equal 2, confusion.nombre_de_faits
    assert_equal true, confusion.possible
    assert_equal 6, confusion.peine_avec_demande.duree
  end

  def test_calcul_sans_demande_de_confusion_de_peine_confusion_impossible
    date_du_jugement = Date.new(2010, 8, 5)
    date_notifiee_a_personne = Date.new(2010, 9, 5) 
    faitA = Fait.new(Date.new(2010, 5, 5))
    jugementA = Jugement.new(faitA, date_du_jugement, Jugement::CAS, Peine.new(5), date_notifiee_a_personne)

    date_du_jugement = Date.new(2012, 5, 6)
    
    faitB = Fait.new(Date.new(2011, 1, 8))

    jugementB = Jugement.new(faitB, date_du_jugement, Jugement::CONTRADICTOIRE, Peine.new(6))

    confusion = Confusion.new()
    confusion + jugementA
    confusion + jugementB

    assert_equal 2, confusion.nombre_de_faits
    assert_equal false, confusion.possible
  end

end
