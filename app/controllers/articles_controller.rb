class ArticlesController < ApplicationController
  before_action :check_access
  def new
  end

  def create
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  def index
    @articles = Article.all
  end

  def show
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
