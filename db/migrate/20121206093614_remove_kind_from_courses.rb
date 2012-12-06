class RemoveKindFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :kind
  end
end
