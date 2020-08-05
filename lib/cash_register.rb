
class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction={}
    end
    # def total
    #     @total
    # end
    # def total= (newTotal)
    #     @total = newTotal
    # end
    # def discount
    #     @discount
    # end
    def add_item(title, price, quantity = 1)
        quantity.times do
            @items.push(title)
        end
        self.last_transaction[:title]=title
        self.last_transaction[:price]=price
        self.last_transaction[:quantity]=quantity
        @total += price * quantity
    end
    def apply_discount
        if self.discount>0
            @total -= @total * @discount/100
            self.total = @total
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end
    def items
        @items
    end
    def void_last_transaction
        self.last_transaction[:quantity].times do
            self.total -= self.last_transaction[:price]
        end
    end
end
