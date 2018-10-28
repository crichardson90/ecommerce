class AddCategoryIdToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :categoty_id, :integer
  end
end
