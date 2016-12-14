class DeleteUselessTableNewsPostclasses < ActiveRecord::Migration
  def change
    drop_table :news
    drop_table :postclasses
  end
end
