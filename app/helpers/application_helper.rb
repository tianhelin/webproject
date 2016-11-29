module ApplicationHelper
  def adminornot?(user)
    user && user.adminkey == 1
  end
end
