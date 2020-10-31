class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = Post.find(comment_params[:comment][:post_id]).comments.create(user: current_user, body: comment_params[:comment][:body])
    redirect_to posts_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Comment deleted successfuly.' }
      format.json { head :no_content }
    end
  end

  private
    def comment_params
      params.permit(:comment => [:post_id, :body])
    end
end
