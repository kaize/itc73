class UpdateSubscribeColumnWithDefaultValue < ActiveRecord::Migration
  def up
  	Course.reset_column_information
    Course.update_all("subscribe_state = 'allowed'", "subscribe_state = NULL")
  end

  def down
    Course.update_all("subscribe_state = NULL")
  end
end
