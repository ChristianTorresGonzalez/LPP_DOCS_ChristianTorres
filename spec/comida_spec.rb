require "spec_helper.rb"

RSpec.describe Comida do
	
	p = Comida::Comida.new
	
	it "has a version number" do
		expect(Comida::VERSION).not_to be nil
	end

	it "Existe nombre alimento" do
		expect(p).to respond_to(:get_nombre)
	end

	it "Existe atributo proteina" do
		expect(p).to respond_to(:get_proteina)
	end
	
	it "Existe atributo Carbohidratos" do
		expect(p).to respond_to(:get_carbohidratos)
	end
	
	it "Existe atributo Lipidos" do
		expect(p).to respond_to(:get_lipidos)
	end
end
