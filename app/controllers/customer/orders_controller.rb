class Customer::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def comfirm
  end
  
  def complete
  end

  def create
  end
  
  def index
  end
  
  def show
  end
  
  private
  
  def item_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end
  
end