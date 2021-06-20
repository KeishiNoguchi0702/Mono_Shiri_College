class TopController < ApplicationController
  def index
    @articles = Article.includes([:rich_text_content]).limit(10).order('created_at DESC')
  end
end
