class AccountDashboardController < ApplicationController
  def show
    has_company?
    @user = Current.user
  end


  private def has_company?
    if !Current.user.company
      redirect_to new_company_path
    end
  end
end
