class Web::PagesController < Web::ApplicationController
  def show
    @page = Page.find params[:id]
  end
end
