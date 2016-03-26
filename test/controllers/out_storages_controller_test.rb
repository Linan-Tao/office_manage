require 'test_helper'

class OutStoragesControllerTest < ActionController::TestCase
  setup do
    @out_storage = out_storages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:out_storages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create out_storage" do
    assert_difference('OutStorage.count') do
      post :create, out_storage: { department_id: @out_storage.department_id, item_id: @out_storage.item_id, item_type: @out_storage.item_type, number: @out_storage.number, out_date: @out_storage.out_date, out_user: @out_storage.out_user, produce_task_id: @out_storage.produce_task_id, user_id: @out_storage.user_id }
    end

    assert_redirected_to out_storage_path(assigns(:out_storage))
  end

  test "should show out_storage" do
    get :show, id: @out_storage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @out_storage
    assert_response :success
  end

  test "should update out_storage" do
    patch :update, id: @out_storage, out_storage: { department_id: @out_storage.department_id, item_id: @out_storage.item_id, item_type: @out_storage.item_type, number: @out_storage.number, out_date: @out_storage.out_date, out_user: @out_storage.out_user, produce_task_id: @out_storage.produce_task_id, user_id: @out_storage.user_id }
    assert_redirected_to out_storage_path(assigns(:out_storage))
  end

  test "should destroy out_storage" do
    assert_difference('OutStorage.count', -1) do
      delete :destroy, id: @out_storage
    end

    assert_redirected_to out_storages_path
  end
end
