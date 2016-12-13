class CreateUserhomeworkships < ActiveRecord::Migration
  def change
    create_table :userhomeworkships do |t|
      t.integer :user_id
      t.integer :homework_id
      t.timestamps null: false
    end
  end
end
