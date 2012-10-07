require "./fait"
require "./condamnation"
require "test/unit" 
require "date"

class TestCondamnation < Test::Unit::TestCase

	def test_condamnations_definitives
		fait1 = Fait.new(Date.new(2010,1,1))
		condamnation1 = Condamnation.new(fait1, Date.new(2010,2,1))

		fait2 = Fait.new(Date.new(2011,1,1))
		condamnation2 = Condamnation.new(fait2, Date.new(2011,2,1))
		

		assert_equal true, condamnation1.est_definitive_avec(condamnation2)
	end

	def test_condamnations_pas_definitives
		fait1 = Fait.new(Date.new(2010,1,1))
		condamnation1 = Condamnation.new(fait1, Date.new(2010,2,1))

		fait2 = Fait.new(Date.new(2010,1,2))
		condamnation2 = Condamnation.new(fait2, Date.new(2010,2,2))
		

		assert_equal true, condamnation1.est_pas_definitive_avec(condamnation2)
	end

end
