class CreateUserClassroomships < ActiveRecord::Migration
  def change
    create_table :user_classroomships do |t|
      t.integer :user_id
      t.integer :classroom_id
      t.timestamps null: false
    end
  end
end
