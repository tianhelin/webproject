class Post < ActiveRecord::Base
  validates :topic,  presence: true
  belongs_to :user
  belongs_to :posttype
end
