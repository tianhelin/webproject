class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :title
      t.string :describe
      t.integer :classroom_id
      t.timestamps null: false
    end
  end
end
