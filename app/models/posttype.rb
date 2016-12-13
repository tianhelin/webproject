class Posttype < ActiveRecord::Base
  validates :typename,  presence: true
  belongs_to :classroom
  has_many :posts
end
