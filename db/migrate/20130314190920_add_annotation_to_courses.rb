class AddAnnotationToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :annotation, :string
  end
end
