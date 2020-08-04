require 'pry'

class CashRegister
    attr_reader :discount
    attr_accessor  :total, :last_transaction, :last_items
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = 0
        @last_items = []
    end

    def add_item(item,price, quantity = 1)
        temp = []
        total_price = price * quantity
        self.total += total_price
        quantity.times { self.items << item }
        quantity.times { temp << item }
        self.last_transaction = total_price
        self.last_items = temp
    end

    def apply_discount
        
        if discount != 0
            self.total -= self.total*(self.discount * (0.01))
            return "After the discount, the total comes to $#{self.total.round}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= @last_transaction
        self.items.delete(self.last_items)
    end
end