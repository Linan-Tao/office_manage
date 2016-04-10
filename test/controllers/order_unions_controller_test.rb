require 'test_helper'

class OrderUnionsControllerTest < ActionController::TestCase
  setup do
    @order_union = order_unions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_unions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_union" do
    assert_difference('OrderUnion.count') do
      post :create, order_union: { agent_id: @order_union.agent_id, code: @order_union.code }
    end

    assert_redirected_to order_union_path(assigns(:order_union))
  end

  test "should show order_union" do
    get :show, id: @order_union
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_union
    assert_response :success
  end

  test "should update order_union" do
    patch :update, id: @order_union, order_union: { agent_id: @order_union.agent_id, code: @order_union.code }
    assert_redirected_to order_union_path(assigns(:order_union))
  end

  test "should destroy order_union" do
    assert_difference('OrderUnion.count', -1) do
      delete :destroy, id: @order_union
    end

    assert_redirected_to order_unions_path
  end
end
