class CreatePosttypes < ActiveRecord::Migration
  def change
    create_table :posttypes do |t|
      t.string :typename
      t.timestamps null: false
    end
  end
end
