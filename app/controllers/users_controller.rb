class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :show, :toggle]
  skip_before_action :require_login, only: [:new, :create]

  def index
    @user = User.all.where(role: "User").order("id")
  end

  def new
    @user = User.new
  end

  def toggle
    @user.update(status: !@user.status)
    redirect_to users_path
  end

  def create
    @user = User.create(user_param)
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_param)
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to :root
  end

  private
  def set_user
    @user = User.find_by id: params[:id]
  end

  def user_param
    params.require(:user).permit(:name, :password, :role)
  end
end
