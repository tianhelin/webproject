class AddColAccountnameToUser < ActiveRecord::Migration
  def change
        add_column :users, :accountname, :string
  end
end
