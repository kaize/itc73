class AddSubscribeColumnToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :subscribe, :string, :default => "allowed"
  end
end
