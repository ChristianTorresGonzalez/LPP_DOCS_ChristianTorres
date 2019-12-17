# Autor:: Christian Torres Gonzalez
# Universidad de La laguna
# Lenguajes y Paradigmas de Programacion
#
# == Documentacion RDOC
#
# === Clase Lista
#
# Definición de la clase Lista con los metodos:
# * metodo initialize
# * each
# * insert_tail
# * isnert_head
# * insert_muchos_head
# * insert_muchos_tail
# * extract_head
# * extract_tail
# * calculo_emisiones_ei
# * calculo_emisiones_ei_anuales
# * calculo_terreno
#

module Comida

    # Estructura utilizada para la lista, es decir, cada lista va a contener un atributovalue que va
    # a ser el alimento que se va a utilizar, y los atributos next y prev para poder moverse por la lista
    Nodo = Struct.new(:value, :next, :prev)

    # Clase utilizada para almacenar un conjunto de alimetnos que vamos a unir para formar un plato
    class Lista
      include Enumerable

      # Variable utilizada para trabajar con la lista por delante,
      # Variable utilizada para trabajar con la lista por detras
      attr_reader :head, :tail

      # Metodo del Enumerable para poder moverse por la lista e implementar metodos como collect
      # sort,select min, max,
      def each
        inicio = head
        while inicio != nil
          yield inicio.value

          inicio = inicio.next
        end
      end

      # Metodo para inizializar los atributos de la clase, que en este caso son a nil
      def initialize
        @head = nil   # Variable utilizada para trabajar con la lista por delante
        @tail = nil   # Variable utilizada para trabajar con la lista por detras
      end

      # Metodo utilizado para insertar datos en la lista por la cola
      def insert_tail(value)
        if (@head == nil && @tail == nil) then
          nodo = Nodo.new(value, nil, nil)
          @head = nodo
          @tail = nodo
        else
          nodo = Nodo.new(value,nil,@tail)
          @tail[:next] = nodo
          @tail = nodo
        end
      end

      # Metodo utilizado para insertar datos en la lista por la cabeza por delante
      def insert_head(value)
        if (@head == nil && @tail == nil) then
          nodo = Nodo.new(value, nil, nil)
          @head = nodo
          @tail = nodo
        else
          nodo = Nodo.new(value,@head,nil)
          @head[:prev] = nodo
          @head = nodo
        end
      end

      # Metodo utilizado para insertar mas de un dato a la vez en la lista por la cabeza
      def insert_muchos_head(value)
        i = 0

        while i < value.length
          insert_head(value[i])
          i += 1
        end
      end

      # Metodo utilizado para insertar mas de un dato a la vez en la lista por la cola
      def insert_muchos_tail(value)
        i = 0

        while i < value.length
          insert_tail(value[i])
          i += 1
        end
      end

      # Metodo utilizado para extraer elementos de la lista por la cabeza, simplemente tenemos
      # que asignar la cabeza al siguiente elemento del que esta apuntando actualmente
      def extract_head()
        if (@head != nil && @tail != nil) then
          if (@head == @tail) then
            @head = nil
            @tail = nil
          else
            @head = @head[:next]
            @head[:prev] = nil
          end
        end
      end

      # Metodo utilizado para extraer elementos de la lista por la cola, simplemente tenemos
      # que asignar la cola al anterior elemento del que esta apuntando actualmente
      def extract_tail()
        if (@head != nil && @tail != nil) then
          if (@head == @tail) then
            @head = nil
            @tail = nil
          else
            @tail = @tail[:prev]
            @tail[:next] = nil
          end
        end
      end

      # Metodo empleado para el calculo de las emisiones de efecto invernadero. Para ello solo tenemos
      # que recorrer cada elemetno de la lista e ir sumando el valor de gei
      def calculo_emisiones_ei
        i = 0
        suma = 0
        nodo = self.head

        while nodo != nil
          suma = suma + nodo.value.gei
          nodo = nodo[:next]
          i += 1
        end

        return suma
      end

      # Metodo para calcular las emisinoes de efecto invernadero anuales. SOlo tenemos que
      # obtener el valor de las emisione de efecto invernadero en un dia y multiplicarlo por 365
      def calculo_emisiones_ei_anuales
        return self.calculo_emisiones_ei * 365
      end

      # Metodo para calcular el terreno empleado en funcion de los alimetnos de la lista.
      # Para ello solo tenemos que recorrer la lista e ir sumando el valor del terreno
      # de cada alimento
      def calculo_terreno(lista)
        i = 0
        suma = 0
        nodo = lista.head

        while nodo != nil
          suma = suma + nodo.value.terreno
          nodo = nodo[:next]
          i += 1
        end

        suma
      end
  end
end
