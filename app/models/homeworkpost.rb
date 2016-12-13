class Homeworkpost < ActiveRecord::Base
  belongs_to :homework,:user
  validates :cotent,  presence: true
end
