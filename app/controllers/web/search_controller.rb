class Web::SearchController < Web::ApplicationController
  def index
  	@query = params[:term].present? ? params[:term] : nil 
  	@results = []
  	if @query
      @results = Course.search @query
    end
  end
end
