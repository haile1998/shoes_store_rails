class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :show]
  skip_before_action :require_login

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_param)
    if @user.save
      redirect_to
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update

  end

  def destroy
  end

  private
  def set_user
    @user = User.find_by id: params[:id]
  end

  def user_param
    params.require(:user).permit(:name, :password, :role)
  end
end
