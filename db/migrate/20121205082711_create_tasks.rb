class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :file
      t.integer :course_id

      t.timestamps
    end
  end
end
