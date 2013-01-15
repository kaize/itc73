class AddPatronymicAndWokplaceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :patronymic, :string
    add_column :users, :workplace, :string
  end
end
