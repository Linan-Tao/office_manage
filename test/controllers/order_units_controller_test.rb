require 'test_helper'

class OrderUnitsControllerTest < ActionController::TestCase
  setup do
    @order_unit = order_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_unit" do
    assert_difference('OrderUnit.count') do
      post :create, order_unit: {  }
    end

    assert_redirected_to order_unit_path(assigns(:order_unit))
  end

  test "should show order_unit" do
    get :show, id: @order_unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_unit
    assert_response :success
  end

  test "should update order_unit" do
    patch :update, id: @order_unit, order_unit: {  }
    assert_redirected_to order_unit_path(assigns(:order_unit))
  end

  test "should destroy order_unit" do
    assert_difference('OrderUnit.count', -1) do
      delete :destroy, id: @order_unit
    end

    assert_redirected_to order_units_path
  end
end
