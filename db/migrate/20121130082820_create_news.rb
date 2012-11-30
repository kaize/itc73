class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :image
      t.text :content
      t.datetime :published_at
      t.string :state

      t.timestamps
    end
  end
end
