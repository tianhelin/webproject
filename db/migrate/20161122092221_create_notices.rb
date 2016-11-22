class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :topic
      t.string :content
      t.integer :user_id
      t.integer :recipient_id
      t.boolean :readed , default:0
      t.timestamps null: false
    end
  end
end
