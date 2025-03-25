class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      Current.user.company = @company
      puts Current.user.inspect
      Current.user.save!
      redirect_to root_path
    end
  end

  private def company_params
    params.require(:company).permit(:name)
  end
end
