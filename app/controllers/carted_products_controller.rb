class CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.where(is_removed: false, is_purchased: false)
  end

  def create
    carted_product = CartedProduct.create(
                                          amount: params[:amount],
                                          product_id: params[:product_id],
                                          is_purchased: false,
                                          is_removed: false
                                          )
    redirect_to "/products"
  end

  def update
    carted_product = CartedProduct.find(params[:id])
    carted_product.update(is_removed: true)

    redirect_to "/carted_products"
  end
end
