module Comida
  class Plato
    attr_reader :nombre_plato, :lista_alimentos, :lista_cantidades

    def initialize(nombre,alimentos,cantidad)
      @nombre_plato = nombre
      @lista_alimentos = alimentos
      @lista_cantidades = cantidad
    end
  end
end
