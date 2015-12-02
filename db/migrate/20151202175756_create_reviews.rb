class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :sale_id
      t.integer :rating
      t.string :comments

      t.timestamps null: false
    end
  end
end
