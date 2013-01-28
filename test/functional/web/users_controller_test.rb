require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  setup do
    graduate = create :graduate
    @attrs = attributes_for :user, :reg
    #raise @attrs.inspect
    @attrs.merge! graduate_id: graduate.id, password_confirmation: @attrs[:password]
    @course = create :course
    @course_two = create :course
    @user = create :user
    @user.activate
    sign_in @user
    @user.courses << @course_two 
  end

  test "should get new" do
    get :new
    assert_response :success
  end
  test "should post create" do
    post :create, user: @attrs
    assert_response :redirect
    assert User.find_by_email(@attrs[:email])
  end
  test "should get edit" do 
      get :edit, id: @user.id 
        assert_response :success
  end
  test "should put update" do
    put :update, id: @user.id, user: @attrs.delete_if{|key, value| key == :personal_data_processing}
    assert_response :redirect
    assert User.find_by_email(@attrs[:email])
  end
  test "should scribe course" do
    set_http_referer courses_path

    attrs = {id: @course.id}
    put :subscribe_course, course: attrs

    assert @user.courses.exists?(@course)
  end

  test "should unscribe course" do
    set_http_referer courses_path

    attrs = {id: @course_two.id}
    put :unscribe_course, course: attrs

    assert !@user.courses.exists?(@course_two)
  end

end
