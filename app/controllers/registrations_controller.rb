class RegistrationsController < Devise::RegistrationsController
  after_action :create_profile, only: [:create]

  private

  def create_profile
    @profile = @user.create_profile!
    @profile.avatar.attach(io: File.open('app/assets/images/default-profile_1.png'), filename: 'thumbnail.png', content_type: 'image/png')
  end

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end

end
