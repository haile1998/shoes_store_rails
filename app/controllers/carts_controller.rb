class CartsController < ApplicationController
  before_action :set_cart

  def index
    @carts = []
    if session[:cart_id] != nil
      @carts << Cart.find_by_id(session[:cart_id])
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      redirect_to @cart
    else
      render :new
    end
  end

  private
  def set_cart
    @cart = Cart.find_by id: params[session[:cart_id]]
  end

  def cart_params
    params.fetch(:cart, {})
  end
end
