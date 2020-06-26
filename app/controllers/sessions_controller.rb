class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by name: params[:session][:name]
    if user && user.password == params[:session][:password]
      if user.status
        log_in(user)
        if user.role == "Admin"
          redirect_to("/admin")
        else
          redirect_to :root
        end
      else
        flash["danger"] = "Your account have been banned!"
        render :new
      end
    else
      flash["danger"] = "Wrong username or password!"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to :root
  end
end
