class AddMaterialIdToMaterialFiles < ActiveRecord::Migration
  def change
    add_column :material_files, :material_id, :integer
  end
end
