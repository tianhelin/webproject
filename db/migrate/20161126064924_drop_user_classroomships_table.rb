class DropUserClassroomshipsTable < ActiveRecord::Migration
  def change
    drop_table :user_classroomships
  end
end
