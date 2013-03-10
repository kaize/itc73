require 'test_helper'

class Web::Social::VkontakteControllerTest < ActionController::TestCase

  setup do
    @auth_hash = generate(:vkontakte_auth_hash)
    @user = create :user
  end

  test "should get authorization with vkontakte" do    
    @user.authorizations << build_authorization(@auth_hash)
    @user.save

    request.env['omniauth.auth'] = @auth_hash
    get :callback

    assert signed_in?
    assert_equal current_user, @user
    assert_response :redirect
  end

  test "should get authorization with vkontakte on existing user" do
    @user.email = @auth_hash[:info][:email] 
    @user.save

    request.env['omniauth.auth'] = @auth_hash
    get :callback

    @user.reload
    assert @user.active?
    assert signed_in?
    assert current_user.authorizations
    assert_response :redirect
  end

  test "should get authorization with vkontakte on new user" do
    request.env['omniauth.auth'] = @auth_hash
    get :callback

    assert User.find_by_email(auth_hash[:info][:email])
    assert current_user.active?
    assert signed_in?
    assert current_user.authorizations
    assert_response :redirect
  end

end
