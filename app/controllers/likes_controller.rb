class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @like = Post.find(like_params[:like][:post_id]).likes.create(user: current_user)
    redirect_to posts_path
  end

  def destroy
    #@like = Post.find(like_params[:like][:post_id]).destroy
    @like = Like.find(params[:id])
    @like.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Unliked successfuly.' }
      format.json { head :no_content }
    end
  end

  private
    def like_params
      params.permit(:like => [:post_id])
    end
end
