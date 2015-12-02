class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :picture_url
      t.integer :condition_id
      t.integer :listing_id
      
      t.timestamps null: false
    end
  end
end
