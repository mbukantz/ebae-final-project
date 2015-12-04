class CreateRecentlyViewedListings < ActiveRecord::Migration
  def change
    create_table :recently_viewed_listings do |t|
      t.integer :listing_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
