require 'test_helper'

class Web::Admin::PartnersControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    admin.activate
    sign_in admin

    @partner = create :partner
    @attrs = attributes_for :partner
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @partner.id
    assert_response :success
  end

  test "should post create" do
    post :create, partner: @attrs
    assert_response :redirect

    assert Partner.find_by_name(@attrs[:name])
  end

  test "should put update" do
    put :update, id: @partner.id, partner: @attrs
    assert_response :redirect

    assert Partner.find_by_name(@attrs[:name])
  end

  test "should delete destroy" do
    delete :destroy, id: @partner.id
    assert_response :redirect

    assert_nil Partner.find_by_id(@partner.id)
  end

end
