class  Customers::ItemsController < ApplicationController

  def index
    @items = Item.all
    @names = Item.page(params[:page])
  end
  
  def show
    @items = Item.all
    @item = Item.find(params[:id])
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :price)
  end
  
end