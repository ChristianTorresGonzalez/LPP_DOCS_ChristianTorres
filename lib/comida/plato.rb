module Comida
  class Plato
    attr_reader :nombre_plato, :lista_alimentos, :lista_cantidades

    def initialize(nombre,alimentos,cantidad)
      @nombre_plato = nombre
      @lista_alimentos = alimentos
      @lista_cantidades = cantidad
    end

    def porcentaje_proteinas
      recorrido = lista_alimentos.head
      acumulador = 0
      porcentaje = 0

      while recorrido != nil
        acumulador = acumulador + recorrido.value.proteinas + recorrido.value.carbohidratos + recorrido.value.lipidos
        porcentaje = porcentaje + recorrido.value.proteinas

        recorrido = recorrido.next
      end

      ((porcentaje * 100)/acumulador).round(2)
    end
  end
end
