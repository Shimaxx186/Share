class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts = Post.order(created_at: :desc).page(params[:page]).per(3)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @post = current_user.posts.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path(@post), notice: '投稿完了しました'
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id), notice: '投稿完了しました'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :contents, :address, :latitude, :longitude)
  end
end
