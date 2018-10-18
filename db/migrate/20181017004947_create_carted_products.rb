class CreateCartedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :carted_products do |t|
      t.integer :product_id
      t.integer :amount
      t.boolean :is_purchased
      t.boolean :is_removed

      t.timestamps
    end
  end
end
