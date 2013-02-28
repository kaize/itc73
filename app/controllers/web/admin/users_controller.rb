#encoding: utf-8
class Web::Admin::UsersController < Web::Admin::ApplicationController

  add_breadcrumb :index, :admin_users_path
  def index
    @course_name_presence = params.include?(:course_id)
    if @course_name_presence
      @q = User.ransack("course_users_course_id_eq" => params[:course_id])
      @course_name = Course.ransack("id_eq_all" => params[:course_id]).result.first_or_initialize.name
    else 
      query = { s: 'created_at desc' }.merge(params[:q] || {})
      @q = User.ransack(query)
    end  
    @users = @q.result.page(params[:page])
  end
  def new
    @user = User.new
    add_breadcrumb :new, new_admin_user_path
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash_success
      redirect_to action: :index
    else
      flash_error
      add_breadcrumb :new, new_admin_user_path
      render :new
    end
  end

  def edit
    @user = User.find(params[:id]).decorate
    add_breadcrumb @user, edit_admin_user_path(@user)
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(params[:user])
      flash_success
      redirect_to action: :index
    else
      @user = user.decorate

      flash_error
      add_breadcrumb @user.full_name, edit_admin_user_path(@user)

      render :edit
    end
  end

  def trigger_state_event
    @user = User.find(params[:id])
    @user.fire_state_event(params[:event])

    flash_success
    redirect_to action: :index
  end

end
