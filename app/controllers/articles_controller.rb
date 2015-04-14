class ArticlesController < ApplicationController
  def new
    check_access
  end

  def create
    check_access
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  def index
    check_access
    @articles = Article.all
  end

  def show
    check_access
    @article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def check_access
      redirect_to sessions_path if session[:user_id] == nil
    end
end
