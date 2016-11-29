class Post < ActiveRecord::Base
  validates :topic,  presence: true
  belongs_to :user , foreign_key: :user_id
  belongs_to :posttype
end
