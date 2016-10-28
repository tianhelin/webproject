class Posttype < ActiveRecord::Base
  validates :typename,  presence: true
  has_many :posts
end
