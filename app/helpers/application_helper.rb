module ApplicationHelper

  def calculate_age(dob)
    if dob.nil?
      'не указан'
    else
      today = Date.today
      age = today.year - dob.year
      age -= 1 if dob.strftime("%m%d").to_i > today.strftime("%m%d").to_i
      age
    end
  end

# Helper methods for Devise. Those methods are needed to create our own views and use them in modal windows.
  def resource_name
    :user
  end

  def resource
   @resource ||= User.new
  end

  def devise_mapping
   @devise_mapping ||= Devise.mappings[:user]
  end
# End of devise helpers.

  
  def helper_get_all_categories
    @categories = Category.all
  end

end

