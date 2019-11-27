module Comida

    Nodo = Struct.new(:value, :next, :prev)

    class Lista
      include Enumerable
      attr_reader :head, :tail

      def each
        inicio = head
        while inicio != nil
          yield inicio.value

          inicio = inicio.next
        end
      end

      def initialize
        @head = nil
        @tail = nil
      end

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

      def insert_muchos_head(value)
        i = 0

        while i < value.length
          insert_head(value[i])
          i += 1
        end
      end

      def insert_muchos_tail(value)
        i = 0

        while i < value.length
          insert_tail(value[i])
          i += 1
        end
      end

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

      def calculo_emisiones_ei_anuales
        return self.calculo_emisiones_ei * 365
      end

      def calculo_terreno(lista)
        i = 0
        suma = 0
        nodo = lista.head

        while nodo != nil
          suma = suma + nodo.value.terreno
          nodo = nodo[:next]
          i += 1
        end

        return suma
      end

      def enumerar
        i = 0

        while i < value.length
      end
    end
  end
end
