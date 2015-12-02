class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :listing_id
      t.integer :buyer_id
      t.integer :price

      t.timestamps null: false
    end
  end
end
