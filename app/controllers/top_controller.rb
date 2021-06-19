class TopController < ApplicationController
  def index
    @articles = Article.includes(:user).limit(6).order('created_at DESC')
  end
end
