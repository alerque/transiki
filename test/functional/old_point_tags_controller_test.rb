require 'test_helper'

class OldPointTagsControllerTest < ActionController::TestCase
  setup do
    @old_point_tag = old_point_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:old_point_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create old_point_tag" do
    assert_difference('OldPointTag.count') do
      post :create, :old_point_tag => @old_point_tag.attributes
    end

    assert_redirected_to old_point_tag_path(assigns(:old_point_tag))
  end

  test "should show old_point_tag" do
    get :show, :id => @old_point_tag.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @old_point_tag.to_param
    assert_response :success
  end

  test "should update old_point_tag" do
    put :update, :id => @old_point_tag.to_param, :old_point_tag => @old_point_tag.attributes
    assert_redirected_to old_point_tag_path(assigns(:old_point_tag))
  end

  test "should destroy old_point_tag" do
    assert_difference('OldPointTag.count', -1) do
      delete :destroy, :id => @old_point_tag.to_param
    end

    assert_redirected_to old_point_tags_path
  end
end
