class AddColorToCourseLevels < ActiveRecord::Migration
  def change
    add_column :course_levels, :color, :string
  end
end
