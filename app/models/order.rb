class Order < ApplicationRecord
    enum payment_method: { credit_card: 0, transfer: 1 }
  has_many :order_details
  belongs_to :customer
  
  def cart_items_total_amount
    sum = 0
    self.cart_items.each do |cart_item|
      sum += cart_item.subtotal
    end
    return sum
  end
  
end