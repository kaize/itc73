class Web::CoursesController < Web::ApplicationController
  add_breadcrumb :index, :courses_path

  def index
    @courses = Course.page(params[:page])
  end 

  def show
    @course = Course.find params[:id]
    add_breadcrumb @course.name, course_path(@course)
  end
end
