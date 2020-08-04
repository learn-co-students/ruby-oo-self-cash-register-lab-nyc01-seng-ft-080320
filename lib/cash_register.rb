class CashRegister
    
    attr_accessor :total, :discount, :cart, :last;

    def initialize(discount= 0)
        @total = 0;
        @discount = discount;
        @cart = [];
    end


    #  it 'also accepts an optional quantity' do
    # expect{cash_register.add_item("book", 5.00, 3)}.to change{cash_register.total}.by(15.00)
    def add_item(item, price, qty= 1)
        self.total += (price * qty)
        qty.times do 
            self.cart << item;
        end
        self.last = {val: price * qty, qty: qty};
    end




    def apply_discount
        if self.discount == 0
            return 'There is no discount to apply.'
        end

        self.total -= (self.total / 100 * self.discount);
        return "After the discount, the total comes to $#{self.total}."
    end

    def items
        return self.cart;
    end

    def void_last_transaction
        self.last[:qty].times do
            cart.pop(1);
        end
        if cart.length == 0
            self.total = 0;
        else
            self.total -= self.last[:val]
        end
    end
end

#dammit i forgot to use git commanfs again added this comment so i can repush lol