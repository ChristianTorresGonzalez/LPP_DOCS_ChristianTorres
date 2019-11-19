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
   end
end
