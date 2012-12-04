class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :kind
      t.string :level
      t.string :state

      t.timestamps
    end
  end
end
