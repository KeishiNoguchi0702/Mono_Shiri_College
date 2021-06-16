class ArticlesController < ApplicationController

  def index
  end

  def new
    @article = Article.new
  end

  private

  def article_params
    params.require(:article).permit(:content)
  end

end
