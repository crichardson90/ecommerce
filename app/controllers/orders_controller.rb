class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def create
    products_in_cart = CartedProduct.where(is_removed: false, is_purchased: false)
    order = Order.create
    products_in_cart.update_all(is_purchased: true, order_id: order.id)

    redirect_to "/products"
  end
    def show
      @order = Order.find(params[:id])
      @order_total = 0

      @order.carted_products.each do |carted_product|
        quantity = carted_product.amount
        price = carted_product.product.price

        total_price = quantity * price
        @order_total += total_price
      end
     end
   end
