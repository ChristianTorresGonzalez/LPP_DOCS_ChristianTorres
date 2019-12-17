# Autor:: Christian Torres Gonzalez
# Universidad de La laguna
# Lenguajes y Paradigmas de Programacion
#
# == Documentacion RDOC
#
# === Clase Comida
#
# Definición de la clase Comida con los metodos:
# * metodo initialize
# * <=>
# * to_s
# * calculo_valor_energetico
# * impacto_ambiental_hombre
# * impacto_ambiental_mujer
#

module Comida
	# Clase utilizada para almacenar los atributos como nombre, proteinas,carbohidratos, lipidos, gei, terreno
	# de los que esta formado cada alimento
	class Comida
		include Comparable

		# Atributo utilizado para almacenar el nombre del alimento,
		# Atributo utilizado para almacenar las proteinas del alimento,
		# Atributo utilizado para almacenar los carbohidratos del alimento,
		# Atributo utilizado para almacenar los lipidos del alimento,
		# Atributo utilizado para almacenar el valor de gases de efecto invernadero
		# Atributo utilizado para almacenar el valor del terreno del alimento
		attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno

		# Metodo utilizado para comparar dos alimentos. El cual se basa en el valor energetico y las emisiones
		# de efecto invernadero y del terrno. Utilizamos un array para la comparacion el cual va a comparar
		# elemento a elemento
		def <=>(other)
			comparando = [self.calculo_valor_energetico, self.gei, self.terreno]
			comparador = [other.calculo_valor_energetico, other.gei, other.terreno]
			comparando <=> comparador
		end

		# Meetodo encargado de asignar a cada variable el valor del argumento recibido
		def initialize(name, protein, carbo, lipido, g, t)
			@nombre = name						# Atributo utilizado para almacenar el nombre del alimento
			@proteinas = protein			# Atributo utilizado para almacenar las proteinas del alimento
			@carbohidratos = carbo		# Atributo utilizado para almacenar los carbohidratos del alimento
			@lipidos = lipido					# Atributo utilizado para almacenar los lipidos del alimento
			@gei = g									# Atributo utilizado para almacenar el valor de gases de efecto invernadero
			@terreno = t							# Atributo utilizado para almacenar el valor del terreno del alimento
		end

		# Metodo utilizado para formatear la salida de las variables de un alimento.
		# Es decir mostrarlo en formato string con los valores de cada atributo
		def to_s
			"(#{@nombre}, #{@proteinas}, #{@carbohidratos}, #{@lipidos}, #{@gei}, #{@terreno})"
		end

		# Funcion utilizada para el calculo del valor energetico, el cual consiste simplemente
		# en multiplicar las proteinas, lipidos y carbohidratos por su respectivo indice
		def calculo_valor_energetico
			(@carbohidratos*4) + (@lipidos*9) + (@proteinas*4)
		end

		# Metodo utilizado para calcular el impacto ambiental del hombre. Para ello se utiliza
		# el valor de los gases de efecto invernadero y del terreno. Al ser un array de alimentos,
		# es por ello que recorremos todo el array y sumamos cada valor de gei y terreno de almento.
		# Esta es la funcion utilizada para el hombre
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

		# Metodo utilizado para calcular el impacto ambiental del hombre. Para ello se utiliza
		# el valor de los gases de efecto invernadero y del terreno. Al ser un array de alimentos,
		# es por ello que recorremos todo el array y sumamos cada valor de gei y terreno de almento.
		# Esta es la funcion utilizada para el hombre
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
