require 'pry'



class CashRegister
  attr_accessor :discount, :total, :last_transaction_amount
  

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
    
  end

  def add_item(item, price, quantity = 1)
    item_info = {}
    item_info[:name] = item
    item_info[:price] = price
    item_info[:quantity] = quantity

    @cart << item_info
    @total += price * quantity
    @last_transaction_amount = item_info[:price]
    @total

  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    end
    @total -= @total * @discount / 100
    "After the discount, the total comes to $#{@total}."
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
    if @cart.empty?
      @total.clear
    else 
      @total -= @last_transaction_amount
    end
    total
  end

end
