class AddKindIdToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :kind_id, :integer
  end
end
