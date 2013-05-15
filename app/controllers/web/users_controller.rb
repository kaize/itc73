class Web::UsersController < Web::ApplicationController
  def new
    title t('.pages_in_titles.registration')
    if registration_by_soc_network?
      @user = UserAuthType.new
      provider = session_auth_hash[:provider]
      @user = UserPopulator.method("via_#{provider}").call(@user, session_auth_hash)
    else
      @user = UserRegistrationType.new
    end
  end

  def create
    @user = (registration_by_soc_network?) ? UserAuthType.new(params[:user]) : UserRegistrationType.new(params[:user])
    if @user.save
      if registration_by_soc_network?
        @user.authorizations << build_authorization(session_auth_hash)
        clear_session_auth_hash
        @user.activate
        sign_in @user
        flash_notice
      else
        token = @user.build_auth_token
        token.save!
        UserMailer.confirm_registration(@user, token).deliver
        flash_success
      end
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
