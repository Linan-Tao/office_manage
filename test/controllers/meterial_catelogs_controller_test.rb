require 'test_helper'

class MeterialCatelogsControllerTest < ActionController::TestCase
  setup do
    @meterial_catelog = meterial_catelogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meterial_catelogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meterial_catelog" do
    assert_difference('MeterialCatelog.count') do
      post :create, meterial_catelog: { name: @meterial_catelog.name }
    end

    assert_redirected_to meterial_catelog_path(assigns(:meterial_catelog))
  end

  test "should show meterial_catelog" do
    get :show, id: @meterial_catelog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meterial_catelog
    assert_response :success
  end

  test "should update meterial_catelog" do
    patch :update, id: @meterial_catelog, meterial_catelog: { name: @meterial_catelog.name }
    assert_redirected_to meterial_catelog_path(assigns(:meterial_catelog))
  end

  test "should destroy meterial_catelog" do
    assert_difference('MeterialCatelog.count', -1) do
      delete :destroy, id: @meterial_catelog
    end

    assert_redirected_to meterial_catelogs_path
  end
end
