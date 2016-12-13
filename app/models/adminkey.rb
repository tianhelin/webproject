class Adminkey < ActiveRecord::Base
  has_many :users
  
  def mytest(user)
    if user.adminkey_id == 1
      return true
    else
      return false
    end
  end
end
