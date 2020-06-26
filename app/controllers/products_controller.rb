class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:show]
  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_param)
    if @product.save
      redirect_to admin_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_param)
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
  def set_product
    @product = Product.find_by id: params[:id]
  end

  def product_param
    params.require(:product).permit(:name, :description, :image_url, :price)
  end
end
