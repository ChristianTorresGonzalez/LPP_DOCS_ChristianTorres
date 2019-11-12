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
		
		def to_s
			"(#{@nombre}, #{@proteinas}, #{@carbohidratos}, #{@lipidos}, #{gei}, #{terreno})"
		end
		
		def calculo_valor_energetico
			(@carbohidratos*4) + (@lipidos*9) + (@proteinas*4)
		end		
		
		def impacto_ambiental_hombre
		
		end
	end
end
