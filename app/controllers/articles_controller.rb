class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :article_find, only: [:show, :edit]
  before_action :article_new, only: [:new, :update]

  def index
    @articles = Article.includes(:user).order("created_at DESC")
  end

  def show
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    render :show if @article.save
  end

  def edit
  end

  def update
    render :show if @article.update(article_params)
  end

  private

  def article_params
    params.require(:article).permit(:title,:content).merge(user_id: current_user.id)
  end

  def article_find
    @article = Article.find(params[:id])
  end

  def article_new
    @article = Article.new
  end

end
