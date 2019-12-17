#
# Autor::   Christian Torres Gonzalez
# Web::     http://www.elcodigok.com.ar
#
# == Documentacion RDOC
#
# === Clase Plato
#
# Definición de la clase Plato con los metodos:
# * metodo initialize
#

module Comida
  class Plato
    attr_reader :nombre_plato, :lista_alimentos, :lista_cantidades

    # Metodo inicializar los atributos del Plato
    def initialize(nombre,alimentos,cantidad)
      @nombre_plato = nombre          # Nombre del Plato
      @lista_alimentos = alimentos    # Lista con los alimentos que forman el plato
      @lista_cantidades = cantidad    # Lista con las cantidades que hay que usar de cada alimento
    end

    # Metodo para calcular el porcentaje total de proteinas de todos los alimentos que se han
    # usado para crear el plato
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

    # Metodo para calcular el porcentaje total de lipidos de todos los alimentos que se han
    # usado para crear el plato
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

    # Metodo para calcular el porcentaje total de hidratos de carbono de todos los alimentos que se han
    # usado para crear el plato
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

    # Calculo del valor calorico del plato en funcion de las proteinas,lipidos e hidratos de carbono
    # que contienen los alimentos usados
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

    # Metodo para formatear la salida de la cantidad de cada alimento con su correspondiente alimento
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

    # Definicion del metodo <=> utilizado para comparar la huella nutricional de platos
    def <=>(other)
      comparando = self.huella_nutricional
      comparador = other.huella_nutricional
      comparando <=> comparador
    end

    # Al igual que en la clase padre, inicializacion de los atributos con los que va a trabajar
    # la clase PlatoHija
    def initialize(nombre,alimentos,cantidad)
      super(nombre,alimentos,cantidad)
      @emisiones_diarias = 0
      @metros_terreno = 0
    end

    # Metodo empleado para el calculo de las emisiones diarias de efecto invernadero
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

    # Metodo empleado para el calculo de los metros de terreno utilizados para la
    # elaboracion del plato
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

    # Metodo para formatear la salida de la cantidad de gases de efecto invernadero de cada alimentos
    #  ademas de los metros de terreno empleados
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

    # Metodo utilizado para el calculo del valor de la huella nutricional del plato, el cual
    # se basa en el dato medio del calculo del valor calorico y el calculo de las emisiones
    # de efecto invernadero
    def huella_nutricional
      numero1 = self.calculo_valor_calorico_total
      numero2 = self.calculo_emisiones_diarias

      if numero1 < 670
        ienergia = 1
      elsif numero1 <=830
         ienergia = 2
      else
         ienergia = 3
      end

      if numero2 < 800
        icarbono = 1
      elsif numero2 <= 1200
        icarbono = 2
      else
        icarbono = 3
      end

      media = (ienergia + icarbono)/2
    end
  end
end
