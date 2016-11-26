class CreateUserclassroomships < ActiveRecord::Migration
  def change
    create_table :userclassroomships do |t|
      t.integer :user
      t.integer :classroom
      t.boolean :approved, :default => false
      t.timestamps null: false
    end
  end
end
