class AddListingIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :listing_id, :integer
  end
end
