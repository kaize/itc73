class Web::PagesController < Web::ApplicationController
  def show
    @page = Page.find_by_slug! params[:id]
    add_breadcrumb @page.name, page_path(@page)
    title @page.name
  end

  def contacts
    @page = Page.contacts
    add_breadcrumb @page.name, page_path(@page)
    title t('.pages_in_titles.contacts')
  end

end
