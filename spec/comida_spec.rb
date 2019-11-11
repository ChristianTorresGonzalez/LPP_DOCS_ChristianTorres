require "spec_helper.rb"

RSpec.describe Comida do
  it "has a version number" do
    expect(Comida::VERSION).not_to be nil
  end

	it "Existe nombre alimento" do
		p = Comida::Comida.new
		expect(p).to respond_to(:get_nombre)
	end
end
