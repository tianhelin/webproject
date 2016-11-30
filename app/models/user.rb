class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name,  presence: true
  has_many :posts
  has_many :notices
  has_many :userclassroomships
  has_many :classrooms, :through => :userclassroomships
  
def adminornot?(user)
  user && user.adminkey == 1
end

def join!(classroom)
  userclassroomships >> classroom
end

def quit!(classroom)
  userclassroomships.delete(classroom)
end

end
