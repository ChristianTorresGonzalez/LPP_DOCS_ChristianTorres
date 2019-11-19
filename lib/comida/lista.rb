module Comida

   Node = Struct.new(:value, :next, :prev)

   class Lista
     attr_reader :head, :tail

     def initialize
       @head = nil
       @tail = nil
     end

     def insert_tail(value)
       if (@head == nil && @tail == nil) then
         nodo = Node.new(value, nil, nil)
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
         nodo = Node.new(value, nil, nil)
         @head = nodo
         @tail = nodo
       else
         nodo = Nodo.new(value,@head,nil)
         @head[:next] = nodo
         @head = nodo
       end
     end

     def insert_muchos_head(valores)
       i = 0

       while i < value.length
         insert_head(value[i])
         i += 1
       end
     end

     def insert_muchos_tail(valores)
       i = 0

       while i < value.length
         insert_tail(value[i])
         i += 1
       end
     end
   end
end
