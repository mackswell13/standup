class InvitationsController < ApplicationController

  def new
    @invitation = Inviation.new
  end
end
