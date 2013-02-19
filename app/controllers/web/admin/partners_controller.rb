class Web::Admin::PartnersController < Web::Admin::ApplicationController
  add_breadcrumb :index, :admin_partners_path

  def index
    @partners = Partner.asc_by_order_at
  end

  def new
    @partner = Partner.new
    add_breadcrumb :new, new_admin_partner_path
  end

  def create
    @partner = Partner.new params[:partner]
    if @partner.save
      flash_success
      redirect_to action: :index
    else
      flash_error
      add_breadcrumb :new, new_admin_partner_path

      render :new
    end
  end

  def edit
    @partner = Partner.find params[:id]
    add_breadcrumb @partner.name, edit_admin_partner_path(@partner)
  end

  def update
    @partner = Partner.find params[:id]
    if @partner.update_attributes params[:partner]
      flash_success
      redirect_to action: :index
    else
      flash_error
      add_breadcrumb :edit, edit_admin_partner_path(@partner)

      render :edit
    end
  end

  def destroy
    partner = Partner.find params[:id]
    partner.destroy

    flash_success
    redirect_to action: :index
  end

end
