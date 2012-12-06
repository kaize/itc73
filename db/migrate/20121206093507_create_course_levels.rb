class CreateCourseLevels < ActiveRecord::Migration
  def change
    create_table :course_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
