class AddApprovedToUserClassroomships < ActiveRecord::Migration
  def change
    add_column :user_classroomships, :approved, :boolean, :default => false
  end
end
