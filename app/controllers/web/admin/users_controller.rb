class Web::Admin::UsersController < Web::Admin::ApplicationController

  add_breadcrumb :index, :admin_users_path
  def index
    query = { s: 'created_at desc' }.merge(params[:q] || {})
    @q = User.ransack(query)
    unless(params[:course_id] == nil) 
      @users = User.from_course(params[:course_id]).page(params[:page])
      @course_name = Course.find(params[:course_id]).name
      @course_name_presence = true
    else
      @users = @q.result.page(params[:page])
      @course_name_presence = false
    end
  end
  def available_to_course
    redirect_to action: :index
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
