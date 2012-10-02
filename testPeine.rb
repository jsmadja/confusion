require "peine.rb"
require "test/unit" 

class TestPeine < Test::Unit::TestCase

	def test_duree_accessible
		peine = Peine.new(5)
		assert_equal 5, peine.duree
	end

	def test_peine_additionnable
		peine1 = Peine.new(5)
		peine2 = Peine.new(6)
		peine3 = peine1 + peine2
		assert_equal 11, peine3.duree
	end

	def test_peine_additionnable_plus_egal
		peine1 = Peine.new(5)
		peine2 = Peine.new(6)
		peine1 += peine2
		assert_equal 11, peine1.duree
	end

end