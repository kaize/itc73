class Web::Admin::OrganizersController < Web::Admin::ApplicationController
  add_breadcrumb :index, :admin_organizers_path

  def index
    @organizers = Organizer.asc_by_order_at
  end

  def new
    @organizer = Organizer.new
    add_breadcrumb :new, new_admin_organizer_path
  end

  def create
    @organizer = Organizer.new params[:organizer]
    if @organizer.save
      flash_success
      redirect_to action: :index
    else
      flash_error
      add_breadcrumb :new, new_admin_organizer_path

      render :new
    end
  end

  def edit
    @organizer = Organizer.find params[:id]
    add_breadcrumb @organizer.name, edit_admin_organizer_path(@organizer)
  end

  def update
    @organizer = Organizer.find params[:id]
    if @organizer.update_attributes params[:organizer]
      flash_success
      redirect_to action: :index
    else
      flash_error
      add_breadcrumb :edit, edit_admin_organizer_path(@organizer)

      render :edit
    end
  end

  def destroy
    organizer = Organizer.find params[:id]
    organizer.destroy

    flash_success
    redirect_to action: :index
  end

end
