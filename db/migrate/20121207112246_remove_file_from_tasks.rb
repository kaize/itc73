class RemoveFileFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :file
  end
end
