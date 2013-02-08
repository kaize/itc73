class Web::UsersController < Web::ApplicationController
  def new
    @user = UserRegistrationType.new
  end

  def edit
    @user = User.find(params[:id]).decorate
    add_breadcrumb @user, edit_admin_user_path(@user)
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes params[:user]
      flash_success
      redirect_to root_path
    else
      flash_error
      add_breadcrumb :edit, edit_user_path(@user)
      render :edit
    end
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
      flash_error
      redirect_to action: :new
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
