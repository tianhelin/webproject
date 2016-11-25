class Classroom < ActiveRecord::Base
  has_many :user_classroomships
  has_many :users, :through => :user_classroomships
  validates :name,  presence: true
end
