class RenamePostColumnPosclassToPostclassId < ActiveRecord::Migration
  def change
    rename_column :posts, :postclass, :postclass_id
  end
end
