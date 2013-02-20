class Web::Account::CoursesController < Web::ApplicationController
  add_breadcrumb :index, :courses_path
  
  def index
    @q = Course.ransack("course_users_user_id_eq" => current_user.id) 
    @course = @q.result.page(params[:page])
  end
end
