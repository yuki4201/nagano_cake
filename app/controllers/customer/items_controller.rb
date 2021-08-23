class  Customer::ItemsController < ApplicationController

  def index
    @items = Item.all
    @names = Item.page(params[:page])
  end
  
  def show
    @item = Item.find(params[:id])
    @items = Item.all
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price)
  end
  
end