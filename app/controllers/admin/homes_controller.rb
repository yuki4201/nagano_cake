class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    @order = Order.new
    @cart_items = CartItem.all
  end
  
  def about
  end
  
end