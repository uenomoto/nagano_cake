class ApplicationController < ActionController::Base
  
  def configure_permitted_parameters
    customers_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :email])
  end
end
