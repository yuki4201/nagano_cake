class Customers::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @addresses = Address.all
  end
  
  def confirm
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end
  
  def complete
  end

  def create
  end
  
  def index
    @orders = Order.all
    @items = Item.all
    if request.post? then
      @order = 1
      if params['r1'] then
        @order = 2
      else
      @order = 3
      end
    end
  end
  
  
  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end
  
end