class Peine

	attr_accessor :duree

	def initialize duree
		@duree = duree
	end

	def +(peine)
		@duree += peine.duree
		Peine.new(@duree)
	end
end