require "pry"
class CashRegister
attr_accessor :total, :discount, :price, :last_transaction
attr_writer :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    @quantity = quantity
    @price = price
    @title = title
    @quantity.times {@items << @title}
    @total += @price * @quantity
    @last_transaction = @price * @quantity
  end
 
  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    else
    discount_percentage = (self.discount/100.0)
    @total = @total - @total*discount_percentage
    "After the discount, the total comes to $#{@total.floor}."
    end
  end

  

  def items
     @items
  end
     
  def void_last_transaction
      self.total -= self.last_transaction
  end
    #binding.pry
   #binding.pry




end

