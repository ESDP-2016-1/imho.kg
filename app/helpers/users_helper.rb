module UsersHelper
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
end
