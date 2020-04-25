require 'pry'



class CashRegister
  attr_accessor :discount, :total
  

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
    @last_transaction_amount = 0
  end

  def add_item(item, price, quantity = 1)
    item_info = {}
    item_info[:name] = item
    item_info[:price] = price
    item_info[:quantity] = quantity

    @cart << item_info
    @last_transaction_amount = @total
    @total += price * quantity
    @total

  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    end
    @total -= @total * @discount / 100
    return "After the discount, the total comes to $#{@total}."
  end 

  def items
    item_names = []
    @cart.each do | item_info |
      #test expects product name * quantity...
      for qty in 1..item_info[:quantity] 
        item_names << item_info[:name]
      end 
    end 
    item_names
  end 
  
  def void_last_transaction()
    binding.pry
    @total -= @last_transaction_amount
  end

end
