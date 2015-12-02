class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :label
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
