class CreateCourseKinds < ActiveRecord::Migration
  def change
    create_table :course_kinds do |t|
      t.string :name

      t.timestamps
    end
  end
end
