# frozen_string_literal: true

# Articles about actions
class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :authenticate_admin!, except: %i[index show]
  def authenticate_admin!
    return if current_user.admin

    redirect_to root_path
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to articles_path
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to articles_path
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
    rescue ActiveRecord::RecordNotFound
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
    rescue ActiveRecord::RecordNotFound
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
