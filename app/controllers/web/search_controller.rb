class Web::SearchController < Web::ApplicationController
  def index
  	@query = params[:term] 
  	@results = []
    @results = Course.search @query
    title t('.pages_in_titles.search') 
  end
end
