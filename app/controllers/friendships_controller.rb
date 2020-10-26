class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    #@friendship = friend_request.create_friendship(friend: friend_request.requestor, inverse_friend: friend_request.receiver, friend_request: friend_request)
    #redirect_to posts_path, notice: 'Friend request was successfully updated(accepted).'
    @friendship = FriendRequest.find(friendship_params[:friendship][:friend_request_id]).build_friendship(friendship_params[:friendship])
    respond_to do |format|
      if @friendship.save
        format.html { redirect_to posts_path, notice: 'Friend request was successfully accepted.' }
        format.json { render friendships_path, status: :created, location: @friendships }

        @friendship.friend_request.update(accepted: true)
      else
        format.html { redirect_to posts_path, notice: 'Friend request was not accepted.' }
        format.json { render json: @friendships.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @friendships = Friendship.all
  end

  def destroy
  end

  private
    def friendship_params
      params.permit(:friendship => [:friend_id, :inverse_friend_id, :friend_request_id])
    end
end
