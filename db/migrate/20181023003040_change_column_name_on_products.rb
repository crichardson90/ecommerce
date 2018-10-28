class ChangeColumnNameOnProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :categoty_id, :category_id
  end
end
