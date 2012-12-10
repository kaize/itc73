class CreateMaterialFiles < ActiveRecord::Migration
  def change
    create_table :material_files do |t|
      t.string :file

      t.timestamps
    end
  end
end
