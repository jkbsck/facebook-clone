class FriendRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend_request, only: [:edit, :update, :destroy]

  def new
    @friend_request = FriendRequest.new
  end

  def index
    @friend_requests = FriendRequest.all
  end

  def create
    @friend_request = FriendRequest.new(friend_request_create_params)

    respond_to do |format|
      if @friend_request.save
        format.html { redirect_to @friend_requests, notice: 'Friend request was successfully created.' }
        format.json { render :index, status: :created, location: @friend_requests }
      else
        format.html { render :new }
        format.json { render json: @friend_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friend_request.destroy
    respond_to do |format|
      format.html { redirect_to @friend_requests, notice: 'Friend request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @friend_request.update(friend_request_accept_params)
        format.html { redirect_to @friend_requests, notice: 'Friend request was successfully updated(accepted).' }
        format.json { render :index, status: :ok, location: @friend_requests }
      else
        format.html { render :edit }
        format.json { render json: @friend_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  private
    def set_friend_request
      @friend_request = FriendRequest.find(params[:id])
    end

    def friend_request_create_params
      params.require(:friend_request).permit(:requestor_id, :receiver_id)
    end

    # accept_nested_attributes_for might be needed in User model -> google 'strong params' for more
    def friend_request_accept_params
      params.require(:friend_request).permit(:accepted)
    end
end
