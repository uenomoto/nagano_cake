module ApplicationHelper

  def full_name(customer)
    customer.last_name + customer.first_name
  end

end
