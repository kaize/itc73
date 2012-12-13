class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.string :image
      t.string :name
      t.string :url
      t.integer :order_at

      t.timestamps
    end
  end
end
