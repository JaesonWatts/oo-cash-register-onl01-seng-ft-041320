require 'pry'

class CashRegister
  attr_accessor :total, :discount, :price, :items
  
  def initalize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

 def add_item(item, price, quantity = 1)
    item_info = {}
    item_info[:name] = item
    item_info[:price] = price
    item_info[:quantity] = quantity
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


