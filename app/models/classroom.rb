class Classroom < ActiveRecord::Base
  has_many :userclassroomships, dependent: :destroy
  has_many :homeworks, dependent: :destroy
  has_many :users, :through => :userclassroomships
  has_one :posttype
  validates :name,  presence: true
end
