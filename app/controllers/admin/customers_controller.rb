class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @names = Customer.page(params[:page])
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active)
  end
  
end