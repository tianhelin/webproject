class Post < ActiveRecord::Base
  validates :topic,  presence: true
  belongs_to :user , foreign_key: :user_id
  belongs_to :posttype

def adminornot?(user)
  user && user.adminkey == 1
end

end
