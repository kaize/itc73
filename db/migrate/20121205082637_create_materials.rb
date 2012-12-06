class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.string :description
      t.string :url
      t.integer :course_id

      t.timestamps
    end
  end
end
