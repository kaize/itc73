require 'test_helper'

class Web::SocialNetworksControllerTest < ActionController::TestCase

  setup do
    admin = create :user, :admin
    sign_in admin
    @course = create :course
    @user = create :user
    @attrs = attributes_for :user
    @facebook_auth_hash = generate(:facebook_auth_hash)
    @vkontakte_auth_hash = generate(:vkontakte_auth_hash)
    @twitter_auth_hash = generate(:twitter_auth_hash)
    @github_auth_hash = generate(:github_auth_hash)
  end

  test "should get failure" do
    get :failure
    assert_response :redirect
  end


  test "should get authorization with facebook" do    
    @user.authorizations << build_authorization(@facebook_auth_hash)
    @user.save

    request.env['omniauth.auth'] = @facebook_auth_hash
    get :facebook
    assert_response :redirect

    assert signed_in?
    assert_equal current_user, @user
  end

  test "should get authorization with facebook on existing user" do
    @user.email = @facebook_auth_hash[:info][:email] 
    @user.save

    request.env['omniauth.auth'] = @facebook_auth_hash
    get :facebook
    assert_response :redirect

    @user.reload
    assert @user.active?
    assert signed_in?
  end

  test "should get authorization with facebook on new user" do
    request.env['omniauth.auth'] = @facebook_auth_hash
    get :facebook
    assert_response :redirect
    assert session_auth_hash
  end

  test "should get authorization with github" do
    @user.authorizations << build_authorization(@github_auth_hash)
    @user.save

    request.env['omniauth.auth'] = @github_auth_hash
    get :github
    assert_response :redirect

    assert signed_in?
    assert_equal current_user, @user
  end

  test "should get authorization with github on existing user" do
    @user.email = @github_auth_hash[:info][:email] 
    @user.save

    request.env['omniauth.auth'] = @github_auth_hash
    get :github
    assert_response :redirect

    @user.reload
    assert @user.active?
    assert signed_in?
  end

  test "should get authorization with github on new user" do
    request.env['omniauth.auth'] = @github_auth_hash
    get :github
    assert_response :redirect
    assert session_auth_hash
  end

  test "should get authorization with twitter" do
    @user.authorizations << build_authorization(@twitter_auth_hash)
    @user.save

    request.env['omniauth.auth'] = @twitter_auth_hash
    get :twitter
    assert_response :redirect

    assert signed_in?
    assert_equal current_user, @user
  end

  test "should get authorization with twitter on existing user" do
    @user.email = @twitter_auth_hash[:info][:email] 
    @user.save

    request.env['omniauth.auth'] = @twitter_auth_hash
    get :twitter
    assert_response :redirect

    @user.reload
    assert @user.active?
    assert signed_in?
  end

  test "should get authorization with twitter on new user" do
    request.env['omniauth.auth'] = @twitter_auth_hash
    get :twitter
    assert_response :redirect
    assert session_auth_hash
  end

  test "should get authorization with vkontakte" do
    @user.authorizations << build_authorization(@vkontakte_auth_hash)
    @user.save

    request.env['omniauth.auth'] = @vkontakte_auth_hash
    get :vkontakte
    assert_response :redirect
    assert signed_in?

    assert_equal current_user, @user
  end

  test "should get authorization with vkontakte on existing user" do
    @user.email = @vkontakte_auth_hash[:info][:email] 
    @user.save

    request.env['omniauth.auth'] = @vkontakte_auth_hash
    get :vkontakte
    assert_response :redirect

    @user.reload
    assert @user.active?
    assert signed_in?
  end

  test "should get authorization with vkontakte on new user" do
    request.env['omniauth.auth'] = @vkontakte_auth_hash
    get :vkontakte
    assert_response :redirect
    assert session_auth_hash
  end
end

