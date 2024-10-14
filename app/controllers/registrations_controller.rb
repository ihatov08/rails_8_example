class RegistrationsController < ApplicationController
  allow_unauthenticated_access
  def new
  end

  def create
    user = User.new(params.permit(:email_address, :password))
    if user.save
      redirect_to new_session_path, notice: "Signed up successfully"
    else
      flash.now[:alert] = "Failed to sign up"
      render :new
    end
  end
end
