class ChangePhoneTypeToLabel < ActiveRecord::Migration
  def change
    rename_column :phones, :type, :label
  end
end
