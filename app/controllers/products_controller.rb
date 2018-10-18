class ProductsController < ApplicationController
  def index
    @products = Product.all.order(updated_at: :desc)
  end

  def show
    id = params[:id]
    @product = Product.find(id)
  end

  def new
    
  end

  def create
    product = Product.create(name: params[:name], description: params[:description], price: params[:price], image_url:params[:image_url])
     redirect_to "/products/#{index}"
  end

  def edit
    id = params[:id]
    @product = Product.find(id)
  end

  def update
    product = Product.find(params[:id])
    product.update(name: params[:name], description: params[:description], price: params[:price], image_url: params[:image_url])
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    
    redirect_to("/products")
  end
end
