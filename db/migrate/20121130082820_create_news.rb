class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :name
      t.string :image
      t.text :body
      t.datetime :published_at
      t.string :state

      t.timestamps
    end
  end
end
