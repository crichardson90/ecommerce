class AddUserIdToCartedProductsAndOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :carted_products, :user_id, :integer
    add_column :orders, :user_id, :integer
  end
end
