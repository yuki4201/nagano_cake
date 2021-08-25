class Customers::CartItemsController < ApplicationController

  def index
    @items = Item.all
    @cart_items = CartItem.all
    @names = Item.page(params[:page])
  end
  
  def create
    @item = Item.new(cart_item_params)
    @item.save
    redirect_to customers_cart_items_path
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update
    redirect_to admin_items_path(@item.id)
  end
  
  def destroy
    @item = Item.new(cart_item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end
  
  private
  
  def cart_item_params
    params.require(:cart).permit(:item_id, :count)
  end
  
  
end