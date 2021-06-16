class ArticlesController < ApplicationController

  def index
  end

  private

  def article_params
    params.require(:article).permit(:content)
  end

end
