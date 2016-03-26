require 'test_helper'

class ItemStoragesControllerTest < ActionController::TestCase
  setup do
    @item_storage = item_storages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_storages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_storage" do
    assert_difference('ItemStorage.count') do
      post :create, item_storage: { brand: @item_storage.brand, item_id: @item_storage.item_id, item_type: @item_storage.item_type, number: @item_storage.number, purchase: @item_storage.purchase, receiver: @item_storage.receiver, storage_date: @item_storage.storage_date, supplier_id: @item_storage.supplier_id }
    end

    assert_redirected_to item_storage_path(assigns(:item_storage))
  end

  test "should show item_storage" do
    get :show, id: @item_storage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_storage
    assert_response :success
  end

  test "should update item_storage" do
    patch :update, id: @item_storage, item_storage: { brand: @item_storage.brand, item_id: @item_storage.item_id, item_type: @item_storage.item_type, number: @item_storage.number, purchase: @item_storage.purchase, receiver: @item_storage.receiver, storage_date: @item_storage.storage_date, supplier_id: @item_storage.supplier_id }
    assert_redirected_to item_storage_path(assigns(:item_storage))
  end

  test "should destroy item_storage" do
    assert_difference('ItemStorage.count', -1) do
      delete :destroy, id: @item_storage
    end

    assert_redirected_to item_storages_path
  end
end
