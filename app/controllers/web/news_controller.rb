class Web::NewsController < Web::ApplicationController
  add_breadcrumb :index, :news_index_path

  def index
    @news = News.published.by_published_at.page(params[:page]).decorate
    title t('.pages_in_titles.news') 
  end

  def show
    news = News.find params[:id]
    @news = news.decorate
    add_breadcrumb @news.name, news_path(@news)
    title @news.name
  end
end
