class Web::NewsController < Web::ApplicationController

  def index
    @news = News.published.by_published_at.page(params[:page])
  end
end
