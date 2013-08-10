class UsersController < ApplicationController
  def new
    render :new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      login_user(@user)
    else
      render :new
    end

  end
end
