require "spec_helper.rb"

RSpec.describe Comida do

	n = "Lentejas"
	pro = 23.5
	c = 52.0
	l = 1.4
	g = 0.4
	t = 3.4
	a = "(Lentejas, 23.5, 52.0, 1.4, 0.4, 3.4)"
	p = Comida::Comida.new(n,pro,c,l,g,t)
	croquetas = Comida::Comida.new(n,pro,c,l,g,t)
	lasaña = Comida::Comida.new(n,pro,c,l,g,t)
	pollo = Comida::Comida.new(n,pro,c,l,g,t)
	carne_v = Comida::Comida.new(carne_v,21.1,0,3.1,50,164)
	carne_c = Comida::Comida.new(carne_c,18,0,17,20,185)
	camarones = Comida::Comida.new(camarones,17.6,1.5,0.6,18,2)
	value = [croquetas,lasaña,pollo]

	it "has a version number" do
		expect(Comida::VERSION).not_to be nil
	end

	it "Existe nombre alimento" do
		expect(p).to respond_to(:nombre)
	end

	it "Existe atributo proteina" do
		expect(p).to respond_to(:proteinas)
	end

	it "Existe atributo Carbohidratos" do
		expect(p).to respond_to(:carbohidratos)
	end

	it "Existe atributo Lipidos" do
		expect(p).to respond_to(:lipidos)
	end

	it "Existe atributo gei" do
		expect(p).to respond_to(:gei)
	end

	it "Existe atributo gei" do
		expect(p).to respond_to(:terreno)
	end

	it "Retorno atributo nombre" do
		expect(p.nombre).to eq(n)
	end

	it "Retorno atributo proteina" do
		expect(p.proteinas).to eq(pro)
	end

	it "Retorno atributo Carbohidratos" do
		expect(p.carbohidratos).to eq(c)
	end

	it "Retorno atributo lipidos" do
		expect(p.lipidos).to eq(l)
	end

	it "Retorno atributo gei" do
		expect(p.gei).to eq(g)
	end

	it "Retorno atributo terreno" do
		expect(p.terreno).to eq(t)
	end

	it "Calculo valor energetico" do
		expect(p).to respond_to(:calculo_valor_energetico)
	end

	it "Calculo valor energetico" do
		expect(p.calculo_valor_energetico).to eq(314.6)
	end

	it "Retorno alimento formateado" do
		expect(p).to respond_to(:to_s)
	end

	it "Retorno alimento formateado" do
		expect(p.to_s).to eq(a)
	end

	it "Calculo impacto_ambiental_hombre" do
		expect(p).to respond_to(:impacto_ambiental_hombre)
	end

	it "Calculo impacto_ambiental_hombre con ejemplo" do
		expect(p.impacto_ambiental_hombre(value)).to eq([1.2000000000000002,10.2])
	end

	it "Calculo impacto_ambiental_mujer con ejemplo" do
		expect(p.impacto_ambiental_mujer(value)).to eq([1.2000000000000002,10.2])
	end

	it "Calculo impacto_ambiental_mujer con ejemplo" do
		expect(p.impacto_ambiental_mujer(value)).to eq([1.2000000000000002,10.2])
	end

	context "Comparacion de alimentos" do
		it "Comprobacion de comparacion de alimentos con menor que" do
			expect(carne_v < carne_c).to eq(true)
		end

		it "Comprobacion de comparacion de alimentos con mayor que" do
			expect(carne_v > carne_c).to eq(false)
		end

		it "Comprobacion de comparacion de alimentos con igualdad" do
			expect(carne_v == carne_c).to eq(false)
		end
	end
end


RSpec.describe Comida::Lista do

	l = Comida::Lista.new

	española = Comida::Lista.new
	carne_v = Comida::Comida.new(carne_v,21.1,0,3.1,50,164)
	carne_c = Comida::Comida.new(carne_c,18,0,17,20,185)
	camarones = Comida::Comida.new(camarones,17.6,1.5,0.6,18,2)
	española.insert_muchos_head([carne_v,carne_c,camarones])

	vasca = Comida::Lista.new
	lentejas = Comida::Comida.new(lentejas,23.5,52,1.4,0.4,3.4)
	chocolate = Comida::Comida.new(chocolate,5.3,47,30,2.3,3.4)
	nuez = Comida::Comida.new(nuez,20,21,54,0.3,7.9)
	vasca.insert_muchos_head([lentejas,chocolate,nuez])

	context "Creacion de clase Lista y atributos" do
		it "Prueba creacion de clase" do
			expect(l).not_to be(nil)
		end

		it "Prueba creacion atributos :head y :tail" do
			expect(l).to respond_to(:head, :tail)
		end
	end

	context "Creacion de metodo para insertar" do
		it "Prueba metodo push_back" do
			expect(l).to respond_to(:insert_tail)
		end

		it "Prueba metodo insert_head" do
			expect(l).to respond_to(:insert_head)
		end

		it "Prueba metodo insertar varios elementos por cabeza" do
			expect(l).to respond_to(:insert_muchos_head)
		end

		it "Prueba metodo insertar varios elementos por cola" do
			expect(l).to respond_to(:insert_muchos_tail)
		end
	end

	context "Creacion de metodo para insertar" do
		it "Prueba metodo extraer cabeza " do
			expect(l).to respond_to(:extract_head)
		end
	end

	context "Pruebas de listas de comida" do
		it "Prueba calculo emisiones de efecto invernadero" do
			expect(española.calculo_emisiones_ei).to eq(88)
		end

		it "Prueba calculo emisiones de efecto invernadero anuales" do
			expect(española.calculo_emisiones_ei_anuales).to eq(32120)
		end

		it "Prueba calculo metros de terreno" do
			expect(española.calculo_terreno(española)).to eq(351)
		end

		it "Prueba calculo emisiones de efecto invernadero vasca" do
			expect(vasca.calculo_emisiones_ei).to eq(2.9999999999999996)
		end

		it "Prueba calculo emisiones de efecto invernadero anuales vasca" do
			expect(vasca.calculo_emisiones_ei_anuales).to eq(1094.9999999999998)
		end

		it "Prueba calculo metros de terreno vasca" do
			expect(vasca.calculo_terreno(vasca)).to eq(14.700000000000001)
		end
	end

	context "Enumeracion de elementos de la lista doblemente enlazada" do
		it "Prueba de enumeracion de lista collect" do
			expect(vasca.collect{|x| x.proteinas < 10.0}).to eq([false,true,false])
		end

		it "Prueba de enumeracion de lista select" do
			expect(vasca.select{|x| x.proteinas < 10.0}).to eq([chocolate])
		end

		it "Prueba de enumeracion de lista max" do
			expect(vasca.max).to eq(nuez)
		end

		it "Prueba de enumeracion de lista min" do
			expect(vasca.min).to eq(lentejas)
		end

		it "Prueba de enumeracion de lista sort" do
			expect(vasca.sort{|a, b| b <=> a}).to eq([nuez,chocolate,lentejas])
		end
	end
end

RSpec.describe Comida::Plato do

	española = Comida::Lista.new
	carne_v = Comida::Comida.new("carne_v",21.1,0,3.1,50,164)
	carne_c = Comida::Comida.new("carne_c",18,0,17,20,185)
	camarones = Comida::Comida.new("camarones",17.6,1.5,0.6,18,2)
	española.insert_muchos_head([carne_v,carne_c,camarones])
	e_cantidad = Comida::Lista.new
	e_cantidad.insert_muchos_head([1000,1000,1000])

	vasca = Comida::Lista.new
	lentejas = Comida::Comida.new(lentejas,23.5,52,1.4,0.4,3.4)
	chocolate = Comida::Comida.new(chocolate,5.3,47,30,2.3,3.4)
	nuez = Comida::Comida.new(nuez,20,21,54,0.3,7.9)
	vasca.insert_muchos_head([lentejas,chocolate,nuez])

	plato  = Comida::Plato.new("pato a la naranja",española,e_cantidad)

	context "Clase Plato" do
		it "COmprobando existencia de atributo nombre de plato" do
			expect(plato).to respond_to(:nombre_plato)
		end

		it "Comprobando existencia de conjunto de alimentos de plato" do
			expect(plato).to respond_to(:lista_alimentos)
		end

		it "Comprobando existencia de conjunto de alimentos de plato" do
			expect(plato).to respond_to(:lista_cantidades)
		end

		it "Comprobando existencia de metodo de porcentaje de proteinas" do
			expect(plato).to respond_to(:porcentaje_proteinas)
		end

		it "Comprobando funcionamiento de calculo de porcentaje de proteinas" do
			expect(plato.porcentaje_proteinas).to eq(71.86)
		end

		it "Comprobando existencia de metodo de porcentaje de lipidos" do
			expect(plato).to respond_to(:porcentaje_lipidos)
		end

		it "Comprobando funcionamiento de calculo de porcentaje de lipidos" do
			expect(plato.porcentaje_lipidos).to eq(26.24)
		end

		it "Comprobando existencia de metodo de porcentaje de lipidos" do
			expect(plato).to respond_to(:porcentaje_carbohidratos)
		end

		it "Comprobando funcionamiento de calculo de porcentaje de lipidos" do
			expect(plato.porcentaje_carbohidratos).to eq(1.9)
		end

		it "Comprobando existencia de metodo de calculo valor calorico total" do
			expect(plato).to respond_to(:calculo_valor_calorico_total)
		end

		it "Comprobando funcionamiento de calculo_valor_calorico_total" do
			expect(plato.calculo_valor_calorico_total).to eq(419.1)
		end

		it "Comprobando existencia de metodo para formaterar salida" do
			expect(plato).to respond_to(:to_s)
		end

		it "Comprobando funcionamiento de metodo para formaterar salida" do
			expect(plato.to_s).to eq(["1000gr de camarones", "1000gr de carne_c", "1000gr de carne_v"])
		end

		it "Comprobando clase del objeto plato" do
			expect(plato.class).to eq(Comida::Plato)
		end

		it "Comprobando el tipo de objeto del objeto plato" do
			expect(plato.kind_of?(Comida::Plato)).to eq(true)
		end

		it "Comprobando clase del objeto plato" do
			expect(Comida::Plato.ancestors).to eq([Comida::Plato, Object, Kernel, BasicObject])
		end
	end
end

RSpec.describe Comida::PlatoHija do

	española = Comida::Lista.new
	queso = Comida::Comida.new("quesa",25.0,1.3,33.0,11.0,41.0)
	lentejas = Comida::Comida.new("lentejas",23.5,52,1.4,0.4,3.4)
	chocolate = Comida::Comida.new("chocolate",5.3,47,30,2.3,3.4)
	española.insert_muchos_head([lentejas,chocolate,queso])
	española_cantidad = Comida::Lista.new
	española_cantidad.insert_muchos_head([7,4,6])

	vasca = Comida::Lista.new
	nuez = Comida::Comida.new(nuez,20,21,54,0.3,7.9)
	cerveza = Comida::Comida.new("cerveza",0.5,3.6,0.0,0.24,0.22)
	vasca.insert_muchos_head([nuez,cerveza])
	vasca_cantidad = Comida::Lista.new
	vasca_cantidad.insert_muchos_head([7,4,6])

	vegetariana = Comida::Lista.new
	leche = Comida::Comida.new("leche",3.3,4.8,3.2,3.2,8.9)
	huevo = Comida::Comida.new("huevo",13.0,1.1,11.0,4.2,5.7)
	tofu = Comida::Comida.new("tofu",8.0,1.9,4.8,2.0,2.2)
	vegetariana.insert_muchos_head([leche,huevo,tofu])
	vegetariana_cantida = Comida::Lista.new
	vegetariana_cantida.insert_muchos_head([10,9,6])

	solo_carne = Comida::Lista.new
	carne_v = Comida::Comida.new("Carne_vaca",21.1,0.0,3.1,50.0,164.0)
	carne_c = Comida::Comida.new("Carne_cordero",18.0,0.0,17.0,20.0,185.0)
	pollo = Comida::Comida.new("Pollo",20.6,0.0,5.6,5.7,7.1)
	solo_carne.insert_muchos_head([carne_v,carne_c,pollo])
	solo_carne_cantidad = Comida::Lista.new
	solo_carne_cantidad.insert_muchos_head([5,4,5])

	vegetaliana = Comida::Lista.new
	vegetaliana.insert_muchos_head([lentejas,tofu,nuez])
	vegetaliana_cantidad = Comida::Lista.new
	vegetaliana_cantidad.insert_muchos_head([6,9,7])

	plato_español = Comida::PlatoHija.new("pato a la naranja",española,española_cantidad)
	plato_vasco = Comida::PlatoHija.new("fuagra",vasca,vasca_cantidad)
	plato_vegetariano = Comida::PlatoHija.new("tonteria",vegetariana,vegetariana_cantida)

	lista_platos = Comida::Lista.new
	lista_platos.insert_muchos_head([plato_español,plato_vasco])

	context "Clase Plato Hija" do
		it "Existencia de atributo para almacenar emisiones diarias" do
			expect(plato_español).to respond_to(:emisiones_diarias)
		end

		it "Existencia de metodo para calcular las emisiones diarias" do
			expect(plato_español).to respond_to(:calculo_emisiones_diarias)
		end

		it "COmprobando funcionamiento de metodo para calcular las emisiones diarias de gei" do
			expect(plato_español.calculo_emisiones_diarias).to eq(0.078)
		end

		it "Existencia de metodo para calcular las metros de terreno" do
			expect(plato_español).to respond_to(:calculo_metros_terreno)
		end

		it "COmprobando funcionamiento de metodo para calcular las emisiones diarias de gei" do
			expect(plato_español.calculo_metros_terreno).to eq(0.1018)
		end

		it "Existencia de metodo para calcular las metros de terreno" do
			expect(plato_español.to_s).to eq(["6gr de quesa", "4gr de chocolate", "7gr de lentejas", 0.078, 0.1018])
		end

		it "Comparando dos platos con meno que" do
			expect(plato_español < plato_vasco).to eq(false)
		end

		# it "Comparando dos platos con mayor que" do
		# 	expect(plato_español > plato_vasco).to eq(true)
		# end

		# it "Comparando dos platos con igual que" do
		# 	expect(plato_español == plato_vasco).to eq(false)
		# end

		it "ENumeracion de listas de platos con collect" do
			expect(lista_platos.collect {|x| x.emisiones_diarias < 500}).to eq([true,true])
		end

		it "ENumeracion de listas de platos con sellect" do
			expect(lista_platos.select {|x| x.emisiones_diarias < 500}).to eq([plato_vasco,plato_español])
		end

		it "ENumeracion de listas de platos con sellect" do
			expect(lista_platos.max).to eq(plato_español)
		end

		it "ENumeracion de listas de platos con sellect" do
			expect(lista_platos.min).to eq(plato_vasco)
		end

		it "Prueba de enumeracion de platos con sort" do
			expect(lista_platos.sort{|a, b| b <=> a}).to eq([plato_español,plato_vasco])
		end
	end

	context "Practica 9: Menú dietético"do
		it "Comprobacion de metodo huella_nutricional para un plato" do
			expect(plato_español).to respond_to(:huella_nutricional)
		end

		it "Comprobacion correcto funcionamiento de huella nutricional" do
			expect(plato_vasco.huella_nutricional).to eq(1)
		end

		it "Comprobando valor huella_nutricional" do
			expect(plato_español.huella_nutricional).to eq(1)
		end

		menu = [plato_español,plato_vasco,plato_vegetariano]
		precio = [50, 40,5]

		it "Comprobando obtencion de maximo de un vector" do
			expect(menu.max).to eq(plato_español)
		end

		it "Incrementacion de precios proporcionalmente" do
			expect(precio.collect{|i| i * ((menu.max).huella_nutricional)}).to eq([50,40,5])
		end
	end
end
