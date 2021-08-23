class Customer::AddressesController < ApplicationController

  def index
    @addresses = Address.all
  end
  
  def edit
    @addresses = Addresses.find(params[:id])
  end
  
  def create
    @addresses = Address.new
    @addresses.save
    redirect_to customers_addresses_path(@address.id)
  end
  
  def update
    @addresses = Addresses.find(params[:id])
    @addresses.update(addresses_params)
    redirect_to customers_address_path(@address.id)
  end
  
  def destroy
    @addresses = Addresses.find(params[:id])
    @addresses.destroy
    redirect_to customers_addresses_path
  end
  
  private
  
  def item_params
    params.require(:addresses).permit(:customer, :name, :postal_code, :address)
  end
  
end