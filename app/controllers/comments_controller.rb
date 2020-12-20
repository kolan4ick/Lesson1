class CommentsController < ApplicationController
  def create
    params[:comment][:post_id] = params[:post_id]
    comment = Comment.create(comments_params)
    redirect_to post_path(comment.post_id) + '#comment_' + comment.id.to_s
  end

  private

  def comments_params
    params.require(:comment).permit(:text, :user_name, :post_id)
  end
end
