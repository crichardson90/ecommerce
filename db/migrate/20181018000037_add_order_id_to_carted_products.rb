class AddOrderIdToCartedProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :carted_products, :order_id, :integer
  end
end
