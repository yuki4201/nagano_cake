class Admin::OrdersController < ApplicationController
    
  def show
    @order = Order.find(params[:id])
    @cart_items = CartItem.all
    # @order.total_payment = @order.shipping_cost + current_customer.cart_items_total_amount
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end
  
end