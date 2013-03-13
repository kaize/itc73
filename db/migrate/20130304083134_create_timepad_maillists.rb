class CreateTimepadMaillists < ActiveRecord::Migration
  def change
    create_table :timepad_maillists do |t|
      t.string :name
      t.integer :items_count
      t.integer :original_id

      t.timestamps
    end
  end

end
