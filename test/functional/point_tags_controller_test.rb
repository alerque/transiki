require 'test_helper'

class PointTagsControllerTest < ActionController::TestCase
  setup do
    @point_tag = point_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:point_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create point_tag" do
    assert_difference('PointTag.count') do
      post :create, :point_tag => @point_tag.attributes
    end

    assert_redirected_to point_tag_path(assigns(:point_tag))
  end

  test "should show point_tag" do
    get :show, :id => @point_tag.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @point_tag.to_param
    assert_response :success
  end

  test "should update point_tag" do
    put :update, :id => @point_tag.to_param, :point_tag => @point_tag.attributes
    assert_redirected_to point_tag_path(assigns(:point_tag))
  end

  test "should destroy point_tag" do
    assert_difference('PointTag.count', -1) do
      delete :destroy, :id => @point_tag.to_param
    end

    assert_redirected_to point_tags_path
  end
end
