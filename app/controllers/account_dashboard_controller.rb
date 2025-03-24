class AccountDashboardController < ApplicationController
  before_action :has_company?
  before_action :is_setup?


  def show
    has_company?
    is_setup?
    @user = Current.user
    @users = User.all.where(company_id: Current.user.company.id)
  end


  private def is_setup?
    puts Current.user.is_setup
    if !Current.user.is_setup
      redirect_to setup_user_path(Current.user)
    end
  end

  private def has_company?
    if !Current.user.company
      redirect_to new_company_path
    end
  end
end
