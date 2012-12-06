class RemoveLevelFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :level
  end
end
