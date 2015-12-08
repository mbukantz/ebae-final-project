class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :initiator_id
      t.integer :noninitiator_id
      t.integer :listing_id
      t.timestamps null: false
    end
  end
end
