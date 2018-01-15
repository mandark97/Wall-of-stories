class CommentsController < ApplicationController
  before_action :get_story
  def index
    @comments = @story.comments.order(created_at: :desc)
  end

  def new
  end

  def create
    comment = Comment.new
    comment.text = comments_params[:text]
    comment.story = @story
    comment.user_id = current_user.id

    comment.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:text)
  end
  def get_story
    @story = Story.find(params[:story_id])
  end
end
