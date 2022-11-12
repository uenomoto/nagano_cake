class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice]= "配送先を追加しました。"
      redirect_to addresses_path
    else
      @addresses = current_customer.addresses
      render :index
    end
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice]= "配送先を変更しました。"
      redirect_to addresses_path
    else
      render :edit
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    @addresses = current_customer.address
    redirect_to addresses_path
  end
  
  private
  
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
  
end
