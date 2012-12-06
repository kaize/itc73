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
    @page = Page.find_by_slug! params[:id]
    breadcrumb @page.name, edit_admin_page_path(@page)
  end

  def update
    @page = Page.find_by_slug! params[:id]
    if @page.update_attributes params[:page]
      flash_success
      redirect_to action: :index
    else
      flash_error
      breadcrumb @page.name, edit_admin_page_path(@page)

      render :edit
    end
  end

  def destroy
    @page = Page.find_by_slug! params[:id]

    if @page.can_destroy?
      @page.destroy
      flash_success
      redirect_to action: :index
    else
      flash_error now: false
      redirect_to :back
    end
  end

end
