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
    @item = Item.find(params[:id])
    @item.update
    redirect_to admin_items_path(@item.id)
  end
  
  def destroy
    @cart_item = Item.new(cart_item_params)
    @cart_item.destroy
    redirect_to customers_cart_items_path(@item.id)
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
  
end