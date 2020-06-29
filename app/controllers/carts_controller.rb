class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = []
    if session[:cart_id] != nil
      @carts << Cart.find_by_id(session[:cart_id])
    end
  end

  def show
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      redirect_to @cart
    else
      render :new
    end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to :root
  end

  private
  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.fetch(:cart, {})
  end
end
