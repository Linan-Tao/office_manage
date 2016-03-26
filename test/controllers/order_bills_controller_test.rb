require 'test_helper'

class OrderBillsControllerTest < ActionController::TestCase
  setup do
    @order_bill = order_bills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_bills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_bill" do
    assert_difference('OrderBill.count') do
      post :create, order_bill: { delivery_date: @order_bill.delivery_date, directive: @order_bill.directive, left: @order_bill.left, order_id: @order_bill.order_id, paid: @order_bill.paid, pay_account: @order_bill.pay_account, pay_date: @order_bill.pay_date, total: @order_bill.total, user_id: @order_bill.user_id }
    end

    assert_redirected_to order_bill_path(assigns(:order_bill))
  end

  test "should show order_bill" do
    get :show, id: @order_bill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_bill
    assert_response :success
  end

  test "should update order_bill" do
    patch :update, id: @order_bill, order_bill: { delivery_date: @order_bill.delivery_date, directive: @order_bill.directive, left: @order_bill.left, order_id: @order_bill.order_id, paid: @order_bill.paid, pay_account: @order_bill.pay_account, pay_date: @order_bill.pay_date, total: @order_bill.total, user_id: @order_bill.user_id }
    assert_redirected_to order_bill_path(assigns(:order_bill))
  end

  test "should destroy order_bill" do
    assert_difference('OrderBill.count', -1) do
      delete :destroy, id: @order_bill
    end

    assert_redirected_to order_bills_path
  end
end
