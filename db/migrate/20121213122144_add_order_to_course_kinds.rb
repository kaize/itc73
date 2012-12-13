class AddOrderToCourseKinds < ActiveRecord::Migration
  def change
    add_column :course_kinds, :order_at, :integer
  end
end
