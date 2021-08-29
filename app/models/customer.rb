class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items
  has_many :orders
  
  def cart_items_total_amount
    sum = 0
    self.cart_items.each do |cart_item|
      sum += cart_item.subtotal
    end
    return sum
  end
end
