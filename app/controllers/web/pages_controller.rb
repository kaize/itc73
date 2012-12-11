class Web::PagesController < Web::ApplicationController
  def show
    @page = Page.find_by_slug! params[:id]
    add_breadcrumb @page.name, page_path(@page)
  end

  def contacts
    @page = Page.contacts
    add_breadcrumb @page.name, page_path(@page)
  end

end
