class Homework < ActiveRecord::Base
  belongs_to :classroom
  has_many :homeworkposts , dependent: :destroy
  has_many :userhomeworkships , dependent: :destroy
  has_many :users, :through => :userhomeworkships
  
  validates :title,  presence: true
end
