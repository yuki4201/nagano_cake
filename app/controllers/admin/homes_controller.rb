class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    @order = Order.new
    @order_details = @order.order_details
    @cart_items = current_customer.cart_items.all
  end
  
  def about
  end
  
end