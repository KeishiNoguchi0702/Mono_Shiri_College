class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :article_find, only: [:show, :edit, :update, :destroy]
  before_action :article_new, only: [:new]

  def index
    @articles = Article.includes([:rich_text_content]).order('created_at DESC').page(params[:page]).per(15)
  end

  def show
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render :show
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @article.destroy
  end

  private

  def article_params
    params.require(:article).permit(:id, :title, :content).merge(user_id: current_user.id)
  end

  def article_find
    @article = Article.find(params[:id])
  end

  def article_new
    @article = Article.new
  end
end
