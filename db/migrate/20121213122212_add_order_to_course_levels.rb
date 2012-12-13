class AddOrderToCourseLevels < ActiveRecord::Migration
  def change
    add_column :course_levels, :order_at, :integer
  end
end
