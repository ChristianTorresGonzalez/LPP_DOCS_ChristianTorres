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
end


RSpec.describe Comida::Lista do

	l = Comida::Lista.new

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

	context "Pruebas de listas de comida"
		española = Comida::Lista.new
		carne_v = Comida::Comida.new(carne_v,21.1,0,3.1,50,164)
		carne_c = Comida::Comida.new(carne_c,18,0,17,20,185)
		camarones = Comida::Comida.new(camarones,17.6,1.5,0.6,18,2)
		española.insert_muchos_head([carne_v,carne_c,camarones])

		it "Prueba calculo emisiones de efecto invernadero" do
			expect(española.calculo_emisiones_ei(española)).to eq(88)
		end

		it "Prueba calculo emisiones de efecto invernadero anuales" do
			expect(española.calculo_emisiones_ei_anuales(española)).to eq(32120)
		end
	end
