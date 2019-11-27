module Comida
  class Plato
    attr_reader :nombre_plato, :lista_alimentos, :lista_cantidades

    def initialize(nombre,alimentos,cantidad)
      @nombre_plato = nombre
      @lista_alimentos = alimentos
      @lista_cantidades = cantidad

      # aux = Lista.new(nil,nil)
      # i = 0
      # while i < alimentos.length
      #   aux.insert_muchos_head(alimentos)
      # end
      # @lista_alimentos = aux

      # aux2 = Lista.new(nil,nil)
      # i = 0
      # while i < alimentos.length
      #   aux2.insert_muchos_head(alimentos)
      # end
      # @lista_alimentos = aux2
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
    include Comparable

    attr_reader :emisiones_diarias, :metros_terreno

    def <=>(other)
      comparando = [self.calculo_emisiones_diarias,self.calculo_metros_terreno]
      comparador = [other.calculo_emisiones_diarias,other.calculo_metros_terreno]
      comparando <=> comparador
    end

    def initialize(nombre,alimentos,cantidad)
      super(nombre,alimentos,cantidad)
      @emisiones_diarias = 0
      @metros_terreno = 0
    end

    def calculo_emisiones_diarias
      recorrido = lista_alimentos.head
      cantidad = lista_cantidades.head

      while (recorrido != nil && cantidad != nil)
        @emisiones_diarias = @emisiones_diarias + ((recorrido.value.gei * cantidad.value)/1000)

        recorrido = recorrido.next
        cantidad = cantidad.next
      end

      @emisiones_diarias
    end

    def calculo_metros_terreno
      recorrido = lista_alimentos.head
      cantidad = lista_cantidades.head

      while (recorrido != nil && cantidad != nil)
        @metros_terreno = @emisiones_diarias + ((recorrido.value.terreno * cantidad.value)/1000)

        recorrido = recorrido.next
        cantidad = cantidad.next
      end

      @metros_terreno
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

      formateo.push(@emisiones_diarias)
      formateo.push(@metros_terreno)

      formateo
    end
  end
end
