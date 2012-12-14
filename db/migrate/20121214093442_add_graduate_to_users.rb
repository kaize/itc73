class AddGraduateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :graduate_id, :integer
  end
end
