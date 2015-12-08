class CreateAdvancedSearches < ActiveRecord::Migration
  def change
    create_table :advanced_searches do |t|
      t.string :keywords
      t.integer :category_id
      t.integer :min_price
      t.integer :max_price

      t.timestamps null: false
    end
  end
end
