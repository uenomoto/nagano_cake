class Public::CustomersController < ApplicationController
  
  
  def show
    @customer = current_customer
  end

  #def edit
    #@customer = current_customer
   # if @customer.update(customer_params)
   # redirect_to edit_customers_path
   # else
    #  render :edit
    #end
 # end
  
  private
  
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end
  
end
