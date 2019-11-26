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

    def porcentaje_lipidos
      recorrido = lista_alimentos.head
      acumulador = 0
      porcentaje = 0

      while recorrido != nil
        acumulador = acumulador + recorrido.value.proteinas + recorrido.value.carbohidratos + recorrido.value.lipidos
        porcentaje = porcentaje + recorrido.value.lipidos

        recorrido = recorrido.next
      end

      ((porcentaje * 100)/acumulador).round(2)
    end

    def porcentaje_carbohidratos
      recorrido = lista_alimentos.head
      acumulador = 0
      porcentaje = 0

      while recorrido != nil
        acumulador = acumulador + recorrido.value.proteinas + recorrido.value.carbohidratos + recorrido.value.lipidos
        porcentaje = porcentaje + recorrido.value.carbohidratos

        recorrido = recorrido.next
      end

      ((porcentaje * 100)/acumulador).round(2)
    end

    def calculo_valor_calorico_total
      recorrido = lista_alimentos.head
      cantidad = lista_cantidades.head
      acumulador = 0

      while (recorrido != nil && cantidad != nil)
        acumulador = acumulador + (((recorrido.value.proteinas * cantidad.value)/1000) * 4) + (((recorrido.value.lipidos * cantidad.value)/1000) * 9) + (((recorrido.value.carbohidratos * cantidad.value)/1000) * 4)

        recorrido = recorrido.next
        cantidad = cantidad.next
      end

      acumulador.round(2)
    end

    def to_s
      recorrido = lista_alimentos.head
      cantidad = lista_cantidades.head
      formateo = []

      while (recorrido != nil && cantidad != nil)
        salida =  cantidad.value.to_s + "gr de " + recorrido.value.nombre
        formateo.push(salida)

        recorrido = recorrido.next
        cantidad = cantidad.next
      end

      formateo
    end
  end

  class PlatoHija < Plato
    
  end
end
