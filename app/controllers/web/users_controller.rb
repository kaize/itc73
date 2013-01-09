class Web::UsersController < Web::ApplicationController
  def new
    @user = UserRegistrationType.new
  end

  def create
    @user = UserRegistrationType.new params[:user]
    if @user.save
      flash_success
      redirect_to root_path
    else
      flash_error
      render :new
    end
  end

  def subscribe_course
    course = Course.find(params[:course][:id])
    current_user.courses << course

    redirect_to :back
  end

  def unscribe_course
    course = Course.find(params[:course][:id])
    current_user.courses.delete(course)

    redirect_to :back
  end

end
