class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @like = Post.find(like_params[:like][:post_id]).likes.create(user: current_user)
    redirect_to posts_path
  end

  def destroy
  end

  private
    def like_params
      params.permit(:like => [:post_id])
    end
end
