class AddEduYearEndToUsers < ActiveRecord::Migration
  def change
    add_column :users, :edu_year_end, :integer
  end
end
