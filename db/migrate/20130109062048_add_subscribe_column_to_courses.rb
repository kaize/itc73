class AddSubscribeColumnToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :subscribe_state, :string
  end
end
