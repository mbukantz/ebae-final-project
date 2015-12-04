class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :sale_id

      t.timestamps null: false
    end
  end
end
