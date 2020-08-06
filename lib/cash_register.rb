require 'pry'

class CashRegister
    attr_accessor :total, :itemsArray, :discount

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @itemsArray = []
        @item_list = []
    end

    def add_item(title, price, quantity = 1)
        scanned_item = {}
        scanned_item[title] = price
        i = quantity
        while i > 0
            @itemsArray.push(scanned_item)
            @item_list.push(title)
            i -= 1
        end
        @total = @total + (price.to_f * quantity.to_f)
        ######
        # i = quantity
        # while i > 0
        #     @items.push(title => )
        #     i -= 1
        # end
        # @total = @total + (price.to_f * quantity.to_f)
    end
    
    def apply_discount
        if @discount != 0
            @total = @total - (@total * (@discount * 0.01))
            return "After the discount, the total comes to $#{@total.round}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @item_list
    end

    # Need support with this function
    #While using pry and applying this method it functions properly. Mathmatically the total becomes 0.0
    # I added the if statement testing @item_list == [] to ensure this would resolve the issue but it didnt work
    def void_last_transaction
        value_minus = @itemsArray.pop
        @item_list.pop

        @total -= value_minus.values[0]

        if @item_list == []
            return @total = 0.0
        end
    end
end

# binding.pry

#@items[1].values[0]