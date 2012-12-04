class Web::Admin::PagesController < Web::Admin::ApplicationController
  breadcrumb :index, :admin_pages_path

  def index
    query = params[:q] || { s: 'slug' }
    @q = Page.ransack(query)
    @pages = @q.result.page(params[:page])
  end

  def new
    @page = Page.new
    breadcrumb :new, new_admin_page_path
  end

  def create
    @page = Page.new params[:page]
    if @page.save
      flash_success
      redirect_to action: :index
    else
      flash_error
      breadcrumb :new, new_admin_page_path

      render :new
    end
  end

  def edit
    @page = Page.find params[:id]
    breadcrumb @page.name, edit_admin_page_path(@page)
  end

  def update
    @page = Page.find params[:id]
    if @page.update_attributes params[:page]
      flash_success
      redirect_to action: :index
    else
      flash_error
      breadcrumb @page.name, edit_admin_page_path(@page)

      render :edit
    end
  end
end
