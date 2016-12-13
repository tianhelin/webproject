class Homeworkpost < ActiveRecord::Base
  belongs_to :homework
  belongs_to :user
  validates :cotent,  presence: true
end
