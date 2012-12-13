class Web::NewsController < Web::ApplicationController
  add_breadcrumb :index, :news_index_path

  def index
    @news = News.published.by_published_at.page(params[:page]).decorate
  end

  def show
    news = News.find params[:id]
    @news = news.decorate
    add_breadcrumb @news.name, news_path(@news)
  end
end
