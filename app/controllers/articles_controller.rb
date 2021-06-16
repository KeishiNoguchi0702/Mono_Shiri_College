class ArticlesController < ApplicationController

  def index
    @articles = Article.order("created_at DESC")
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    render :show if @article.save
  end

  private

  def article_params
    params.require(:article).permit(:title,:content).merge(user_id: current_user.id)
  end

end
