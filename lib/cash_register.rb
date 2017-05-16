
class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(item, price, quantity=1)
    self.total += price * quantity
    quantity.times { self.items << item }
    @last_transaction = price * quantity
  end

  def apply_discount
    if discount > 0
      self.total = (total * ((100 - discount.to_f)/100)).to_i
    "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= @last_transaction
  end

end
