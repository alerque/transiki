require 'test_helper'

class RouteTagsControllerTest < ActionController::TestCase
  setup do
    @route_tag = route_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:route_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create route_tag" do
    assert_difference('RouteTag.count') do
      post :create, :route_tag => @route_tag.attributes
    end

    assert_redirected_to route_tag_path(assigns(:route_tag))
  end

  test "should show route_tag" do
    get :show, :id => @route_tag.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @route_tag.to_param
    assert_response :success
  end

  test "should update route_tag" do
    put :update, :id => @route_tag.to_param, :route_tag => @route_tag.attributes
    assert_redirected_to route_tag_path(assigns(:route_tag))
  end

  test "should destroy route_tag" do
    assert_difference('RouteTag.count', -1) do
      delete :destroy, :id => @route_tag.to_param
    end

    assert_redirected_to route_tags_path
  end
end
