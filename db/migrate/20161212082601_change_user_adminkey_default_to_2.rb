class ChangeUserAdminkeyDefaultTo2 < ActiveRecord::Migration
  def change
    change_column_default(:users, :adminkey,2)
  end
end
