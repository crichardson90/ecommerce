class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = current_user.orders
  end

  def create
    products_in_cart = CartedProduct.where(is_removed: false, is_purchased: false)
    my_order = Order.new

  if products_in_cart.any?
    my_order = Order.create(user_id: current_user.id)
    products_in_cart.update_all(is_purchased: true, order_id: my_order.id)
    flash[:success] = "Thank you for your order!"
  else
    flash[:alert] = "Please add products to your cart"
  end
  
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
