class CashRegister
    attr_accessor :total, :items, :discount, :price
  def initialize(discount=0)
    @total = 0 
    @discount = discount
    @items = []
  end
  def add_item(title, price, quantity=1)
    @price = price
    if quantity>1
      i=0
      while i<quantity
      @items<< title
      i+=1 
    end
  else @items<< title
  end
  @total += price*quantity
  self.price = {val: price * quantity, qty: quantity};
 end 
 def apply_discount()
   if discount > 0
     @discount = @discount/100.to_f
     @total = @total - (@total*@discount)
     "After the discount, the total comes to $#{@total.to_i}."
   else "There is no discount to apply."
   end
 end
 
 #def void_last_transaction() <--- only gave me zeroed out total, not - last transaction.
 #  @total -= self.price
 #end

 def void_last_transaction
   self.price[:qty].times do
       items.pop(1);
       end
       if items.length == 0
          self.total = 0;
       else
       self.total -= self.price[:val]
   end
 end
 end
