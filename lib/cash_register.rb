# even though this passes all the tests, it seems clunky
# the problem with TDD is that there are details of the functionality I'm unclear on
# ex: should void_last_transaction be able to go back two steps?
# ex: why would't the price after discount include a decimal point?
# so I'm not super happy with this but it works, so /shrug

class CashRegister
    attr_accessor :discount, :total, :items, :previous_total

    def initialize(discount = 0.0)
        @discount = discount.to_f
        @total = 0
        @items = []
        @previous_total = 0
    end

    def add_item(title, price, quantity = 1)
        self.previous_total = self.total
        self.total = self.total + price * quantity
        

        quantity.times do 
            self.items << title
        end
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
        self.total = self.total * ((100.0-@discount)/100.0)
        "After the discount, the total comes to $#{@total.to_i}."
        end
    end
    
    def void_last_transaction
        self.total = self.previous_total
    end
end
