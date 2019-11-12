require "spec_helper.rb"

RSpec.describe Comida do
	
	n = "pepe"
	pro = 2.5
	c = 3.1
	l = 5.9
	g = 7
	t = 1000.325
	p = Comida::Comida.new(n,pro,c,l,g,t)
	
	it "has a version number" do
		expect(Comida::VERSION).not_to be nil
	end

	it "Existe nombre alimento" do
		expect(p).to respond_to(:nombre)
	end

	it "Existe atributo proteina" do
		expect(p).to respond_to(:proteina)
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
		expect(p.proteina).to eq(pro)
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
end
