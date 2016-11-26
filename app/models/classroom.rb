class Classroom < ActiveRecord::Base
  has_many :userclassroomships
  has_many :users, :through => :userclassroomships
  validates :name,  presence: true
end
