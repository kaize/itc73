class Web::SearchController < Web::ApplicationController
  def index
  	@query = params[:term] 
  	@results = []
    @results = Course.search @query
  end
end
