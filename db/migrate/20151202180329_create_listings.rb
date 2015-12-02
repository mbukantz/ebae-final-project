class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :starting_price
      t.integer :current_price
      t.integer :shipping_price
      t.integer :seller_id
      t.datetime :start_time
      t.integer :duration

      t.timestamps null: false
    end
  end
end
