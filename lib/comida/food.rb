module Comida
	class Comida
		
		attr_reader :nombre, :proteina, :carbohidratos, :lipidos, :gei, :terreno
		
		def initialize(name, protein, carbo, lipido, g, t)
			@nombre = name
			@proteina = protein
			@carbohidratos = carbo
			@lipidos = lipido
			@gei = g
		end
		
	end
end
