require 'test_helper'

class Web::Admin::TasksControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    sign_in admin

    @task = create :task
    @attrs = attributes_for :task
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    post :create, task: @attrs
    assert_response :redirect

    assert Task.find_by_name @attrs[:name]
  end

  test "should get edit" do
    get :edit, id: @task.id
    assert_response :success
  end

  test "should put update" do
    put :update, id: @task.id, task: @attrs
    assert_response :redirect

    assert Task.find_by_name @attrs[:name]
  end

  test "should delele destroy" do
    delete :destroy, id: @task.id
    assert_response :redirect

    assert_nil Task.find_by_id @task
  end
end
