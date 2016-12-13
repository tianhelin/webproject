class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name,  presence: true
  belongs_to :adminkey , foreign_key: :adminkey_id
  has_many :posts,:notices,:userclassroomships,:homeworkposts
  has_many :classrooms, :through => :userclassroomships
end
