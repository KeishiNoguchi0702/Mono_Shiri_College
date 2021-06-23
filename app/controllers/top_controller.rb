class TopController < ApplicationController
  def index
    @articles = Article.includes([:rich_text_content]).limit(20).order('created_at DESC')
  end
end
