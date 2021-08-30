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
    @order.shipping_cost = 800
    if params[:order][:address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
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
      @order.total_payment = @order.shipping_cost + current_customer.cart_items_total_amount
      # @cart_items.each do |cart_item|
    #     @order.total_payment += cart_item.subtotal
    # end
  end
  
  def complete
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
      @order_items = @order.order_details.new
      @order_items.item_id = cart_item.item.id
      @order_items.price = cart_item.item.price
      @order_items.amount = cart_item.amount
      @order_items.save
    end
    current_customer.cart_items.destroy_all
    redirect_to customers_orders_complete_path
  end
  
  def index
    @orders = Order.all
    @order = Order.new
  end
  
  
  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end
  
end