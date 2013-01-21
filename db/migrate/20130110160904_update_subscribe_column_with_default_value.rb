class UpdateSubscribeColumnWithDefaultValue < ActiveRecord::Migration
  def up
  	Course.reset_column_information
    Course.update_all({:subscribe_state => :allowed}, :subscribe_state => nil)
  end

  def down
    Course.update_all(:subscribe_state => nil)
  end
end
