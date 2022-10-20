class Admin::CustmersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
  end

  def show
  end

  def edit
  end
  
  def update
  end
  
  
   private
   
   def customer_params
     params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
   end
end
