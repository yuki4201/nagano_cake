class  Customers::ItemsController < ApplicationController

  def index
    @items = Item.all
    @names = Item.page(params[:page])
  end
  
  def show
    @item = Item.find(params[:id])
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path(@item.id)
  end
  
  private
  
  def item_params
    params.require(:item).permit(:)
  end
  
end
