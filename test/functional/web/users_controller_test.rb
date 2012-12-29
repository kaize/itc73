require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  setup do
    graduate = create :graduate
    @attrs = attributes_for :user, :reg
    @attrs.merge! graduate_id: graduate.id, password_confirmation: @attrs[:password]
    
    @course = create :course
    @course_two = create :course
    @user = create :user
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

  test "should scribe course" do
    request.env['HTTP_REFERER'] = courses_path

    attrs = {course_id: @course.id}
    put :scribe_course, course: attrs

    assert @user.courses.exists?(@course)
  end

  test "should unscribe course" do
    request.env['HTTP_REFERER'] = courses_path

    attrs = {course_id: @course_two.id}
    put :unscribe_course, course: attrs

    assert !@user.courses.exists?(@course_two)
  end

end
