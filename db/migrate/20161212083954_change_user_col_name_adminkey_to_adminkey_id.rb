class ChangeUserColNameAdminkeyToAdminkeyId < ActiveRecord::Migration
  def change
    rename_column :users, :adminkey, :adminkey_id
  end
end
