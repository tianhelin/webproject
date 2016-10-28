class RenamePostColumnPostclassIdToPosttypeId < ActiveRecord::Migration
  def change
    rename_column :posts, :postclass_id, :posttype_id
  end
end
