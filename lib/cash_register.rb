require 'pry'


class CashRegister

    attr_accessor :total, :discount, :items, :last_transaction_cost

    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(name, price, quantity=1)
        self.total += price*quantity
        quantity.times do 
            items << name
        end
        self.last_transaction_cost = price*quantity
    end

    def apply_discount
        if discount != 0
            self.total = (total * ((100.0 - discount.to_f)/100)).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        if items.length > 0
            self.total = self.total - self.last_transaction_cost
        else
            self.total
        end
    end
end

cash = CashRegister.new

#binding.pry

