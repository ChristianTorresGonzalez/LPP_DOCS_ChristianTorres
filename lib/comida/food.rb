module Comida
	class Comida
		
		attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno
		
		def initialize(name, protein, carbo, lipido, g, t)
			@nombre = name
			@proteinas = protein
			@carbohidratos = carbo
			@lipidos = lipido
			@gei = g
			@terreno = t
		end
		
		def calculo_valor_energetico
			(@carbohidratos*4) + (@lipidos*9) + (@proteinas*4)
		end		
	end
end
