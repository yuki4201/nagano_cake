class Customer::CartItemsController < ApplicationController

  def index
    @items = Item.all
    @names = Item.page(params[:page])
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path(@item.id)
  end
  
  def destroy
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end
  private
  
  def item_params
    params.require(:cart_items).permit(:item, :customer, :amount)
  end
  
end