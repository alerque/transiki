require 'test_helper'

class OldRouteTagsControllerTest < ActionController::TestCase
  setup do
    @old_route_tag = old_route_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:old_route_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create old_route_tag" do
    assert_difference('OldRouteTag.count') do
      post :create, :old_route_tag => @old_route_tag.attributes
    end

    assert_redirected_to old_route_tag_path(assigns(:old_route_tag))
  end

  test "should show old_route_tag" do
    get :show, :id => @old_route_tag.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @old_route_tag.to_param
    assert_response :success
  end

  test "should update old_route_tag" do
    put :update, :id => @old_route_tag.to_param, :old_route_tag => @old_route_tag.attributes
    assert_redirected_to old_route_tag_path(assigns(:old_route_tag))
  end

  test "should destroy old_route_tag" do
    assert_difference('OldRouteTag.count', -1) do
      delete :destroy, :id => @old_route_tag.to_param
    end

    assert_redirected_to old_route_tags_path
  end
end
