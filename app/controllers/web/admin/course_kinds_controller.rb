class Web::Admin::CourseKindsController < Web::Admin::ApplicationController
  breadcrumb :courses, :admin_courses_path
  breadcrumb :index, :admin_course_kinds_path

  def index
    query = params[:q] || { s: 'created_at desc' }
    @q = Course::Kind.ransack(query)
    @kinds = @q.result.page(params[:page])
  end

  def new
    @kind = Course::Kind.new
    breadcrumb :new, new_admin_course_kind_path
  end

  def create
    @kind = Course::Kind.new params[:course_kind]
    if @kind.save
      flash_success
      redirect_to action: :index
    else
      flash_error
      breadcrumb :new, new_admin_course_kind_path

      render :new
    end
  end

  def edit
    @kind = Course::Kind.find params[:id]
    breadcrumb @kind.name, edit_admin_course_kind_path(@kind)
  end

  def update
    @kind = Course::Kind.find params[:id]
    if @kind.update_attributes params[:course_kind]
      flash_success
      redirect_to action: :index
    else
      flash_error
      breadcrumb @kind.name, edit_admin_course_kind_path(@kind)

      render :edit
    end
  end

  def destroy
    kind = Course::Kind.find params[:id]
    kind.destroy

    flash_success
    redirect_to action: :index
  end
end
