class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_admin!, only: [:edit, :update, :destroy]
  def authenticate_admin!
    unless current_user.admin
      redirect_to root_path
    end
  end

  def index
    @posts = Post.all
  end

  def show
    begin
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to posts_path
    end
  end

  def new
    @post = Post.new
  end

  def edit
    begin
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to posts_path
    end
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    begin
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to posts_path
    end

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    begin
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to posts_path
    end
    @post.destroy

    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :text)
    end
end
