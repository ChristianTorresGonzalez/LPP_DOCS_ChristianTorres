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
			
			#puts "Impacto ambiental:  #{impacto_ambiental}"
			#puts "Impacto del terreno:  #{impacto_terreno}"
		end
			
			#cantidad = []
						
			#while i < value.length
				#cantidad[i] = 0
				#i = i + 1
			#end
			
			#i = 0
			#suma_proteinas = 0
			#fallo = 0
			
			#loop do
				#if suma_proteinas += value[i].proteinas > 54
					#i += 1
					#fallo += 1
					
					#if i == value.length
						#i = 0
					#end
				#else
					#suma_proteinas += value[i].proteinas
				
					#cantidad[i] += 1
					
					#impacto_ambiental += value[i].gei
					
					#if i == value.length
						#i = 0
					#else
						#i += 1
					#end
				#end	
			#if  fallo >  
				#break
			#end
		#end
	#end
		#end
	end
end
