class Item < ApplicationRecord
 belongs_to :genre
 attachment :image
 has_many :cart_items, dependent: :destroy
 has_many :order_details
 
 def with_tax_price
  (price * 1.1).floor
 end
  
 def subtotal
　item.with_tax_price * amount
 end
  
end