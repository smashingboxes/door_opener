require 'test_helper'

class OpeningsControllerTest < ActionController::TestCase
  setup do
    @opening = openings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:openings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opening" do
    assert_difference('Opening.count') do
      post :create, opening: @opening.attributes
    end

    assert_redirected_to opening_path(assigns(:opening))
  end

  test "should show opening" do
    get :show, id: @opening.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @opening.to_param
    assert_response :success
  end

  test "should update opening" do
    put :update, id: @opening.to_param, opening: @opening.attributes
    assert_redirected_to opening_path(assigns(:opening))
  end

  test "should destroy opening" do
    assert_difference('Opening.count', -1) do
      delete :destroy, id: @opening.to_param
    end

    assert_redirected_to openings_path
  end
end
