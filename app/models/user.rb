class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  validates :name,  presence: true
  validates :accountname,  presence: true
  validates :email,  presence: true
  belongs_to :adminkey , foreign_key: :adminkey_id
  has_many :posts
  has_many :notices
  has_many :homeworkposts
  has_many :userclassroomships
  has_many :userhomeworkships
  has_many :classrooms, :through => :userclassroomships
  has_many :homeworks, :through => :userhomeworkships
end
