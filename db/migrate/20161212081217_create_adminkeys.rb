class CreateAdminkeys < ActiveRecord::Migration
  def change
    create_table :adminkeys do |t|
      t.string :rolename
      t.timestamps null: false
    end
  end
end
