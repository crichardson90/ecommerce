class Product < ApplicationRecord
  has_many :carted_products
  has_many :product_categories
  has_many :categories, through: :product_categories
  
  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 500}
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :image_url, presence: true

def create_categories(input_category_ids)
  input_catergory_ids.each do |category_ids|

    ProductCatrgory.create(product_id: id, category_id: category_id)
    end
  end

  def update_categories(input_category_ids)
    submitted_category_ids = input_category_ids.map { |category_id| category_id.to_i }

    old_category_ids = category_ids - submitted_category_ids
    new_category_ids = submitted_category_ids - category_ids

    old_category_ids.each do |category_id|
      ProductCategory.find_by(product_id: id, category_id: category_id).destroy
    end
    new_category_ids.each do |category_id|
      ProductCategory.create(product_id: id, category_id: category_id)
    end
  end
end
