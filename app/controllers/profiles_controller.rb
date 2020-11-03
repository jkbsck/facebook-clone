class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    if profile_params[:id].nil?
      @profile = current_user.create_profile!
    else
      @profile = Profile.find(profile_params[:id])
    end
  end

  def edit
    @profile = Profile.find(profile_params[:id])
  end

  def update
    @profile = current_user.profile
    #@profile.update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_path(:id => @profile.id), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def profile_params
      params.permit(:id, :user_id, :description, :avatar)
    end
end
