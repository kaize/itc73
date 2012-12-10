class Web::Admin::MaterialsController < Web::Admin::ApplicationController
  add_breadcrumb :index, :admin_materials_path

  def index
    query = params[:q] || { s: 'created_at desc' }
    @q = Material.ransack(query)
    @materials = @q.result.page(params[:page])
  end

  def new
    @material = Material.new
    add_breadcrumb :new, new_admin_material_path
  end

  def create
    @material = Material.new params[:material]
    if @material.save
      flash_success
      redirect_to action: :index
    else
      flash_error
      add_breadcrumb :new, new_admin_material_path

      render :new
    end
  end

  def edit
    @material = Material.find params[:id]
    add_breadcrumb @material.name, edit_admin_material_path(@material)
  end

  def update
    @material = Material.find params[:id]
    if @material.update_attributes params[:material]
      flash_success
      redirect_to action: :index
    else
      flash_error
      add_breadcrumb @material.name, edit_admin_material_path(@material)

      render :edit
    end
  end

  def destroy
    material = Material.find params[:id]
    material.destroy

    flash_success
    redirect_to action: :index
  end
end
