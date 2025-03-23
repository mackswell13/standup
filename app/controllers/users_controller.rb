class UsersController < ApplicationController
  allow_unauthenticated_access only: [ :new, :create ]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])

    if @user != Current.user
      redirect_to user_path(Current.user)
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      start_new_session_for @user
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  private def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end
