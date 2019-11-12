require "spec_helper.rb"

RSpec.describe Comida do
	
	n = "pepe"
	pro = "full"
	p = Comida::Comida.new(n)
	
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
	
end
