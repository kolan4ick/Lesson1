class PostsController < ApplicationController
  before_action :post, only: %i[edit]

  def index
    @posts = Post.all
  end

  def show
    @comments = post.comments
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    post.username = current_user.email
    post.save
    redirect_to post
  end

  def edit; end

  def update
    post.update(post_params)
    redirect_to post
  end

  def destroy
    post.destroy
    redirect_to posts_path
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :image, images: [])
  end
end
