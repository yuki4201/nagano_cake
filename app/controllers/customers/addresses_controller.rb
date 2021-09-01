class Customers::AddressesController < ApplicationController

  def index
    @addresses = Address.all
    @address = Address.new
  end
  
  def create
    @addresses = Address.new(address_params)
    @addresses.save
    redirect_to customers_addresses_path
  end
  
  def edit
    @addresses = Address.find(params[:id])
  end
  
  def update
    @addresses = Address.find(params[:id])
    @addresses.update(address_params)
    redirect_to customers_address_path
  end
  
  def destroy
    @addresses = Address.find(params[:id])
    @addresses.destroy
    redirect_to customers_address_path
  end
  
  private
  
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
  
end