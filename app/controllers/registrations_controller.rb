class RegistrationsController < Devise::RegistrationsController
  after_action :create_profile, only: [:create]

  private

  def create_profile
    @profile = @user.create_profile!
  end

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end

end
