require "test/unit" 

require "./fait"
require "./confusion"
require "date"
require "./jugement"

class TestConfusion < Test::Unit::TestCase
  
  def test_calcul_sans_demande_de_confusion_de_peine
  	date_du_jugement = "2010-8-5"
	  date_notifiee_a_personne = "2012-5-5" 
    faitA = Fait.new("2010-5-5")
    jugementA = Jugement.new(faitA, date_du_jugement, Jugement::CAS, date_notifiee_a_personne)

    date_du_jugement = "2012-5-6"
    faitB = Fait.new("2011-1-8")
    jugementB = Jugement.new(faitB, date_du_jugement)

    confusion = Confusion.new()
    confusion + jugementA
    confusion + jugementB

    assert_equal 2, confusion.nombre_de_faits
    assert_equal true, confusion.possible
  end

  def test_calcul_avec_demande_de_confusion_de_2_peines
    date_du_jugement = "2010-8-5"
    date_notifiee_a_personne = "2012-5-5" 
    jugementA = Jugement.new(
        Fait.new("2010-5-5"), 
        date_du_jugement, 
        Jugement::CAS, 
        date_notifiee_a_personne)

    date_du_jugement = "2012-5-6"
    jugementB = Jugement.new(
        Fait.new("2011-1-8"), 
        date_du_jugement)

    confusion = Confusion.new()
    confusion + jugementA
    confusion + jugementB

    assert_equal 2, confusion.nombre_de_faits
    assert_equal true, confusion.possible
  end

  def test_calcul_sans_demande_de_confusion_de_peine_confusion_impossible
    date_du_jugement = "2010-8-5"
    date_notifiee_a_personne = "2010-9-5" 
    jugementA = Jugement.new(Fait.new("2010-5-5"), date_du_jugement, Jugement::CAS, date_notifiee_a_personne)

    date_du_jugement = "2012-5-6"
    
    jugementB = Jugement.new(Fait.new("2011-1-8"), date_du_jugement)

    confusion = Confusion.new()
    confusion + jugementA
    confusion + jugementB

    assert_equal 2, confusion.nombre_de_faits
    assert_equal false, confusion.possible
  end

  def test_calcul_avec_demande_de_confusion_de_3_peines
    date_du_jugement = "2010-2-1"
    jugementA = Jugement.new(
        Fait.new("2010-1-1"), date_du_jugement)

    date_du_jugement = "2010-3-1"
    jugementB = Jugement.new(
        Fait.new("2010-2-1"), date_du_jugement)

    date_du_jugement = "2010-4-1"
    jugementC = Jugement.new(
        Fait.new("2010-3-1"), date_du_jugement)

    confusion = Confusion.new()
    confusion + jugementA
    confusion + jugementB
    confusion + jugementC

    assert_equal 3, confusion.nombre_de_faits
  end

  def test_etude_demande_de_confusion_de_2_peines
    date_du_jugement = "2010-8-5"
    date_notifiee_a_personne = "2012-5-5" 
    jugementA = Jugement.new(
        Fait.new("2010-5-5", "Vol"), 
        date_du_jugement, 
        Jugement::CAS, 
        date_notifiee_a_personne)

    date_du_jugement = "2012-5-6"
    jugementB = Jugement.new(
        Fait.new("2011-1-8", "Braquage"), 
        date_du_jugement)

    confusion = Confusion.new()
    confusion + jugementA
    confusion + jugementB

    assert_equal ["Vol n'est pas definitif avec Braquage"], confusion.etude
  end

  def test_etude_demande_de_confusion_de_3_peines
    date_du_jugement = "2010-2-1"
    jugementA = Jugement.new(
        Fait.new("2010-1-1", "Braquage"), 
        date_du_jugement)

    date_du_jugement = "2010-3-1"
    jugementB = Jugement.new(
        Fait.new("2010-2-1", "VAMA"), 
        date_du_jugement)

    date_du_jugement = "2010-4-1"
    jugementC = Jugement.new(
        Fait.new("2010-3-1", "Viol"), 
        date_du_jugement)

    confusion = Confusion.new()
    confusion + jugementA
    confusion + jugementB
    confusion + jugementC

    assert_equal ["Braquage n'est pas definitif avec VAMA",
                  "Braquage est definitif avec Viol",
                  "VAMA n'est pas definitif avec Viol"], confusion.etude
  end

  def test_dessin_des_jugements
    jugementA = Jugement.new(Fait.new("2011-1-1", "Braquage"), "2012-2-1")
    jugementB = Jugement.new(Fait.new("2011-8-1", "VAMA"), "2012-12-1")
    jugementC = Jugement.new(Fait.new("2012-3-1", "Viol"), "2013-12-1")
    jugementD = Jugement.new(Fait.new("2012-9-1", "Viol avec vol"), "2015-4-1")

    confusion = Confusion.new()
    confusion + jugementA
    confusion + jugementB
    confusion + jugementC
    confusion + jugementD

    confusion.dessiner("confusion.png")
  end

end
