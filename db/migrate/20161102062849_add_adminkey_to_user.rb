class AddAdminkeyToUser < ActiveRecord::Migration
  def change
    add_column :users, :adminkey , :integer , :default => 0
  end
end
