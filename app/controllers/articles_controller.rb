class ArticlesController < ApplicationController

  def index
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    redirect_to root_path if @article.save
  end

  private

  def article_params
    params.require(:article).permit(:title,:content).merge(user_id: current_user.id)
  end

end
