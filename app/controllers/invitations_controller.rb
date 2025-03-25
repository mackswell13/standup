class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.company = Current.user.company

    @invitation.save

    redirect_to root_path
  end

  private def invitation_params
    params.require(:invitation).permit(:email_address)
  end
end
