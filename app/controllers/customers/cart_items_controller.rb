class Customers::CartItemsController < ApplicationController

  def index
    @items = Item.all
    @cart_items = CartItem.all
    @names = Item.page(params[:page])
  end
  
  def create
    @item = CartItem.new(cart_item_params)
    @item.customer_id = current_customer.id
    @item.save
    redirect_to customers_cart_items_path
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to customers_cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to customers_cart_items_path
  end
  
  def destroy_all
    @cart_item = CartItem.all
    @cart_item.destroy_all
    redirect_to  customers_cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end