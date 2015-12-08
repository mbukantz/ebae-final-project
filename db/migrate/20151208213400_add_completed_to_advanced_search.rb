class AddCompletedToAdvancedSearch < ActiveRecord::Migration
  def change
    add_column :advanced_searches, :completed, :boolean
  end
end
