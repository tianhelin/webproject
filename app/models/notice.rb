class Notice < ActiveRecord::Base
  validates_presence_of :topic, :content, :recipient_id
  
  belongs_to :user , foreign_key: :user_id
end
