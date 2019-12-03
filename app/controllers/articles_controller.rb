class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_admin!, except: [:index, :show]
  def authenticate_admin!
    unless current_user.admin
      redirect_to root_path
    end
  end

  def index
    @articles = Article.all
  end

  def show
    begin
      @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to articles_path
    end
  end

  def new
    @article = Article.new
  end

  def edit
    begin
      @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to articles_path
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    begin
      @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to articles_path
      return
    end
    
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    begin
      @article = Article.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to articles_path
      return
    end
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end