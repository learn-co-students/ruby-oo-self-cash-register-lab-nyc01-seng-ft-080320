require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :price_total


    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
          quantity.times do
            @items.push(title)
          end
          @price_total = price * quantity
        self.total += @price_total
    end

    def apply_discount
        if @discount != 0
            percentage_float = @discount.to_f/100.to_f
            self.total -= (@total * percentage_float)
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

   def void_last_transaction
        self.total -= @price_total
   end

end


