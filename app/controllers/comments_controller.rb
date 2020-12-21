class CommentsController < ApplicationController
  def create
    params[:comment][:post_id] = params[:post_id]
    comment = Comment.create(comments_params)
    comment.user_name = current_user.email
    comment.save
    redirect_to post_path(comment.post_id) + '#comment_' + comment.id.to_s
  end

  def destroy
    post = Post.find(params[:post_id])
    post.comments.find(params[:id]).destroy
    redirect_to post_path(post)
  end

  private

  def comments_params
    params.require(:comment).permit(:text, :post_id)
  end
end
