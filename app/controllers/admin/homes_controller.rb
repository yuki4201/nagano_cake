class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    @order = Order.new
    @order_details = @order.order_details
  end
  
  def about
  end
  
end