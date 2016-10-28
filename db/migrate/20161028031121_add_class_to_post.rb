class AddClassToPost < ActiveRecord::Migration
  def change
    add_column :posts, :postclass, :string
  end
end
