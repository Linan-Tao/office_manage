require 'test_helper'

class OrderPartsControllerTest < ActionController::TestCase
  setup do
    @order_part = order_parts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_parts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_part" do
    assert_difference('OrderPart.count') do
      post :create, order_part: {  }
    end

    assert_redirected_to order_part_path(assigns(:order_part))
  end

  test "should show order_part" do
    get :show, id: @order_part
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_part
    assert_response :success
  end

  test "should update order_part" do
    patch :update, id: @order_part, order_part: {  }
    assert_redirected_to order_part_path(assigns(:order_part))
  end

  test "should destroy order_part" do
    assert_difference('OrderPart.count', -1) do
      delete :destroy, id: @order_part
    end

    assert_redirected_to order_parts_path
  end
end
