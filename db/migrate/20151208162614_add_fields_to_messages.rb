class AddFieldsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :read_at, :datetime
    add_column :messages, :sender_deleted, :boolean
    add_column :messages, :recipient_deleted, :boolean
  end
end
