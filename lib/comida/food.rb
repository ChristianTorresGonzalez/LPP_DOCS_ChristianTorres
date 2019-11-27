module Comida
	class Comida
		include Comparable

		attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno

		def <=>(other)
			comparando = [self.calculo_valor_energetico, self.gei, self.terreno]
			comparador = [other.calculo_valor_energetico, other.gei, other.terreno]
			comparando <=> comparador
		end

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

		def impacto_ambiental_hombre(value)
						i = 0
			impacto_ambiental = 0.0
			impacto_terreno = 0.0

			while i < value.length
				impacto_ambiental += value[i].gei
				impacto_terreno += value[i].terreno
				i += 1
			end

			salida  = [impacto_ambiental, impacto_terreno]
		end

		def impacto_ambiental_mujer(value)
			i = 0
			impacto_ambiental = 0.0
			impacto_terreno = 0.0

			while i < value.length
				impacto_ambiental += value[i].gei
				impacto_terreno += value[i].terreno
				i += 1
			end

			salida  = [impacto_ambiental, impacto_terreno]

		end
	end
end
