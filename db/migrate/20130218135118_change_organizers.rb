class ChangeOrganizers < ActiveRecord::Migration
  def change
    add_column :organizers, :type, :string
    rename_table :organizers, :firms 
  end
end
