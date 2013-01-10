class Web::Admin::CoursesController < Web::Admin::ApplicationController
  add_breadcrumb :index, :admin_courses_path

  def index
    query = params[:q] || { s: 'created_at desc' }
    @q = Course.ransack(query)
    @courses = @q.result.page(params[:page])
  end

  def new
    @course = CourseType.new
    add_breadcrumb :new, new_admin_course_path
  end

  def create
    @course = CourseType.new params[:course]
    if @course.save
      flash_success
      redirect_to action: :index
    else
      flash_error
      add_breadcrumb :new, new_admin_course_path

      render :new
    end
  end

  def edit
    @course = CourseType.find params[:id]
    add_breadcrumb @course.name, edit_admin_course_path(@course)
  end

  def update
    @course = CourseType.find params[:id]
    if @course.update_attributes params[:course]
      flash_success
      redirect_to action: :index
    else
      flash_error
      add_breadcrumb @course.name, edit_admin_course_path(@course)

      render :edit
    end
  end

  def destroy
    course = Course.find params[:id]
    course.destroy

    flash_success
    redirect_to action: :index
  end

  def subscribe_state_event
    @course = Course.find(params[:id])
    @course.fire_subscribe_state_event(params[:event])

    flash_success
    redirect_to action: :index
  end
end
