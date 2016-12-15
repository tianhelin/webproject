class AddColIntroductionToClassroom < ActiveRecord::Migration
  def change
    add_column :classrooms, :introduction, :string
  end
end
