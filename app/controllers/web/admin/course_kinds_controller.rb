class Web::Admin::CourseKindsController < Web::Admin::ApplicationController
  add_breadcrumb :courses, :admin_courses_path
  add_breadcrumb :index, :admin_course_kinds_path

  def index
    @kinds = Course::Kind.page(params[:page]).asc_by_order_at
  end

  def new
    @kind = Course::Kind.new
    add_breadcrumb :new, new_admin_course_kind_path
  end

  def create
    @kind = Course::Kind.new params[:course_kind]
    if @kind.save
      flash_success
      redirect_to action: :index
    else
      flash_error
      add_breadcrumb :new, new_admin_course_kind_path

      render :new
    end
  end

  def edit
    @kind = Course::Kind.find params[:id]
    add_breadcrumb @kind.name, edit_admin_course_kind_path(@kind)
  end

  def update
    @kind = Course::Kind.find params[:id]
    if @kind.update_attributes params[:course_kind]
      flash_success
      redirect_to action: :index
    else
      flash_error
      add_breadcrumb @kind.name, edit_admin_course_kind_path(@kind)

      render :edit
    end
  end

  def destroy
    kind = Course::Kind.find params[:id]
    begin
      kind.destroy
      flash_success
    rescue ActiveRecord::DeleteRestrictionError
      flash_error now: false
    ensure
      redirect_to action: :index
    end
  end
end
