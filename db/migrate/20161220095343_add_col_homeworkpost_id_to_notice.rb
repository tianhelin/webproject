class AddColHomeworkpostIdToNotice < ActiveRecord::Migration
  def change
    add_column :notices, :homeworkpost_id, :integer,:default => 0
  end
end
