class ChangeColNameInUserclassroomship < ActiveRecord::Migration
  def change
    rename_column :userclassroomships, :user, :user_id
    rename_column :userclassroomships, :classroom, :classroom_id
  end
end
