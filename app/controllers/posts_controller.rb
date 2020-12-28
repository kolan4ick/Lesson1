class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  before_action :user_post, only: %i[edit update destroy]
  # before_action :post

  def index
    @posts = Post.all.includes(:likes).with_attached_image
  end

  def show
    post.update(views: post.views + 1)
    @comments = post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    post.views = 0
    if post.save
      redirect_to post
    else
      pp 'error' + post
    end
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

  def user_post
    redirect_back(fallback_location: root_path) unless @post = current_user.posts.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :views, :body, :image, :category_id, images: [])
  end
end
