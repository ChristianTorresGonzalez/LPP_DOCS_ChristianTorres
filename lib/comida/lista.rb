module Comida

   Nodo = Struct.new(:value, :next, :prev)

   class Lista
     attr_reader :head, :tail

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
   end
end
