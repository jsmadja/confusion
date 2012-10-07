require "./fait"
require "test/unit" 

class TestFait < Test::Unit::TestCase

	def test_date_des_faits_accessible
		fait = Fait.new("2012-1-1")
		assert_equal Date.new(2012, 1, 1), fait.date_des_faits
	end

end
