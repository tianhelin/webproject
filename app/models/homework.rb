class Homework < ActiveRecord::Base
  belongs_to :classroom
  has_many :homeworkposts
  has_many :userhomeworkships
  has_many :users, :through => :userhomeworkships
  
  validates :title,  presence: true
end
