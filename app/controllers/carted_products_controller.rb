class CartedProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @carted_products = CartedProduct.where(is_removed: false, is_purchased: false, user_id: current_user.id)
  end

  def create
    carted_product = CartedProduct.new(
                            amount: params[:amount],
                            product_id: params[:product_id],
                            is_purchased: false,
                            is_removed: false,
                            user_id: current_user.id
                            )
  if carted_product.save
    flash[:success] = "Product added to Cart"
    redirect_to "/products"
  else
    flash[:alert] = "Enter amount greater than 0"
    redirect_to "/products/#{params[:product_id]}"
  end
end

  def update
    carted_product = CartedProduct.find(params[:id])
    carted_product.update(is_removed: true)

    redirect_to "/carted_products"
  end
end
