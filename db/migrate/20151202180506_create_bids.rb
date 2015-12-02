class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :amount
      t.integer :listing_id
      t.integer :buyer_id

      t.timestamps null: false
    end
  end
end
