module Comida
  class Plato
    attr_reader :nombre_plato, :lista_alimentos

    def initialize(nombre)
      @nombre_plato = nombre
    end
  end
end
