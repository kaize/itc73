class Web::CoursesController < Web::ApplicationController
  add_breadcrumb :index, :courses_path

  def index
    @q = Course.ransack("course_users_user_id_eq" => params[:user_id]) 
    @course = @q.result.page(params[:page])
    @user_name_presence = params.include?(:user_id)
  end

  def show
    @course = Course.find params[:id]
    add_breadcrumb @course.name, course_path(@course)
  end
end
