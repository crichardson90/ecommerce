class ProductsController < ApplicationController
  def index
    if params[:category] && params[:category].length > 2
      @category_name = params[:category]
      @category = Category.where('name iLIKE ?', "%#{@category_name}%")[0]

      if @category != nil
        @products = @category.products
      else
        @products = []
      end
    elsif params[:category] && params[:category].length < 3
      @error_message = "Enter a category with 3 or more characters!"
      @products = Product.all.order(id: :desc)
    else
      @products = Product.all.order(id: :desc)
    end
  end


  def show
    id = params[:id]
    @product = Product.find(id)
  end

  def new
    @categories = Category.all 
    @product = Product.new
  end

  def create
    @product = Product.new(
                            name: params[:name], 
                            description: params[:description], 
                            price: params[:price], 
                            image_url: params[:image_url])
    if @product.save
      @product.create_categories(params[:category_ids]) if params[:category_ids]
      redirect_to "/products"
    else
      @categories = Category.all
      render 'new'
    end
  end
      


  def edit
    id = params[:id]
    @product = Product.find(id)
    @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(name: params[:name], description: params[:description], price: params[:price], image_url: params[:image_url])

      @product.update_categories(params[:category_ids]) if params[:category_ids]
      redirect_to "/products/#{@product.id}"
    else
      @categories = Category.all
      render 'edit'
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    
    redirect_to("/products")
  end
end
