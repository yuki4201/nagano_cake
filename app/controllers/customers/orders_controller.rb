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
    binding.pry
    if params[:order][:address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name
    elsif params[:order][:address] == "2"
      @addresses = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address] == "3"
      address = Address.new
      address.postal_code = params[:order][:new_postal_code]
      address.address = params[:order][:new_address]
      address.name = params[:order][:new_name]
      address.customer = current_customer.id
      address.save
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    end
  end
  
  def complete
  end

  def create
  end
  
  def index
    @orders = Order.all
    @items = Item.all
  end
  
  
  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end
  
end