require 'pry'

class CashRegister
  attr_accessor :total, :discount, :price, :items
  
  def initalize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

 def add_item(title,price,quantity = 1)
    if quantity>1
      i=0
      while i<quantity
        @items << title
        i+=1
      end
    else
      @items << title
    end
    @total += price*quantity
    @last_transaction_amount = @total
    @total
  end


  def apply_discount
    if @discount > 0
      @discount_to_remove = (price *discount)/100
      @total -= @discount_to_remove
      "After the discount, the total comes to $#{total}"
    end
  end

  def void_last_transaction()
    @total -= @price
  end


end


