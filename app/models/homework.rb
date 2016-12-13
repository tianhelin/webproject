class Homework < ActiveRecord::Base
  belongs_to :classroom
  has_many :homeworkposts
  validates :title,  presence: true
end
