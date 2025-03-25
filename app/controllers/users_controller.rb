class UsersController < ApplicationController
  before_action :correct_user, only: [ :setup, :update ]

  after_action :set_is_setup, only: [ :update ]

  allow_unauthenticated_access only: [ :new, :create ]

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_create_params)

    if @user.save
      start_new_session_for @user
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def setup
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_setup_params)
      redirect_to root_path
    else
      render :setup, status: :unprocessable_entity
    end
  end

  private

  def user_create_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end

  def user_setup_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless @user == Current.user
  end

  def set_is_setup
    @user = User.find(params[:id])
    if @user.first_name && @user.last_name
      @user.is_setup = true
      @user.save
    end
  end
end
