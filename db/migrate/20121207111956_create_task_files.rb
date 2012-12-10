class CreateTaskFiles < ActiveRecord::Migration
  def change
    create_table :task_files do |t|
      t.string :file
      t.integer :task_id

      t.timestamps
    end
  end
end
