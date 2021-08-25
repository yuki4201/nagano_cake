class Customers::HomesController < ApplicationController

  def top
    @items = Item.all
    @names = Item.page(params[:page])
  end
  
  def about
  end
  
end