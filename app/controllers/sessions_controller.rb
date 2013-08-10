class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_email_and_password(params[:user][:email], params[:user][:password])
    if @user
     login_user(@user)
    else
      render :new
    end
  end
end


