class AddLevelIdToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :level_id, :integer
  end
end
