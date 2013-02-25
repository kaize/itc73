class Web::UsersController < Web::ApplicationController
  def new
    @user = UserRegistrationType.new
    title t('.pages_in_titles.registration') 
  end

  def create
    @user = UserRegistrationType.new params[:user]
    if @user.save
      token = @user.build_auth_token
      token.save!
      UserMailer.confirm_registration(@user, token).deliver
      flash_success
      redirect_to root_path
    else
      flash_error now: true
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
