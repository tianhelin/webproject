class CreateHomeworkposts < ActiveRecord::Migration
  def change
    create_table :homeworkposts do |t|
      t.string :content
      t.integer :user_id
      t.integer :homework_id
      t.boolean :handin , :default => false
      t.timestamps null: false
    end
  end
end
