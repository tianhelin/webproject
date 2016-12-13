class AddClassroomIdToPosttype < ActiveRecord::Migration
  def change
    add_column :posttypes, :classroom_id, :integer, :default => 0
  end
end
