class Web::Admin::GraduatesController < Web::Admin::ApplicationController
  add_breadcrumb :users, :admin_users_path
  add_breadcrumb :index, :admin_graduates_path

  def index
    @graduates = Graduate.page(params[:page]).asc_by_order_at
  end

  def new
    @graduate = Graduate.new
    add_breadcrumb :new, new_admin_graduate_path
  end

  def create
    @graduate = Graduate.new params[:graduate]
    if @graduate.save
      flash_success
      redirect_to action: :index
    else
      flash_error
      add_breadcrumb :new, new_admin_graduate_path

      render :new
    end
  end

  def edit
    @graduate = Graduate.find params[:id]
    add_breadcrumb @graduate.name, edit_admin_graduate_path(@graduate)
  end

  def update
    @graduate = Graduate.find params[:id]
    if @graduate.update_attributes params[:graduate]
      flash_success
      redirect_to action: :index
    else
      flash_error
      add_breadcrumb @graduate.name, edit_admin_graduate_path(@graduate)

      render :edit
    end
  end

  def destroy
    graduate = Graduate.find params[:id]
    graduate.destroy

    flash_success
    redirect_to action: :index
  end
end
