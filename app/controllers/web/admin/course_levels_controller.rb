class Web::Admin::CourseLevelsController < Web::Admin::ApplicationController
  add_breadcrumb :courses, :admin_courses_path
  add_breadcrumb :index, :admin_course_levels_path

  def index
    @levels = Course::Level.page(params[:page]).asc_by_order_at
  end

  def new
    @level = Course::Level.new
    add_breadcrumb :new, new_admin_course_level_path
  end

  def create
    @level = Course::Level.new params[:course_level]
    if @level.save
      flash_success
      redirect_to action: :index
    else
      flash_error
      add_breadcrumb :new, new_admin_course_level_path

      render :new
    end
  end

  def edit
    @level = Course::Level.find params[:id]
    add_breadcrumb @level.name, edit_admin_course_level_path(@level)
  end

  def update
    @level = Course::Level.find params[:id]
    if @level.update_attributes params[:course_level]
      flash_success
      redirect_to action: :index
    else
      flash_error
      add_breadcrumb @level.name, edit_admin_course_level_path(@level)

      render :edit
    end
  end

  def destroy
    level = Course::Level.find params[:id]
    begin
      level.destroy
      flash_success
    rescue ActiveRecord::DeleteRestrictionError
      flash_error now: false
    ensure
      redirect_to :back
    end
  end
end
