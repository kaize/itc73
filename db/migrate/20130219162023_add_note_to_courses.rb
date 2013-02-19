class AddNoteToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :note, :string
  end
end
