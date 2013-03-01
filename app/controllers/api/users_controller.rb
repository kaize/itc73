class Api::UsersController < Api:: ApplicationController
  respond_to :xlsx
  
  def index
    @users = User.active
    if params[:course].present?
      @users = User.ransack("course_users_course_id_eq" => params[:course]).result 
    end
    respond_with @users
  end
end
