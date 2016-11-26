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
end
