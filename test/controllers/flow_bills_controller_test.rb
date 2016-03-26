require 'test_helper'

class FlowBillsControllerTest < ActionController::TestCase
  setup do
    @flow_bill = flow_bills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flow_bills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flow_bill" do
    assert_difference('FlowBill.count') do
      post :create, flow_bill: { account: @flow_bill.account, application_fund_id: @flow_bill.application_fund_id, bill_code: @flow_bill.bill_code, bill_date: @flow_bill.bill_date, bill_type: @flow_bill.bill_type, check_date: @flow_bill.check_date, check_status: @flow_bill.check_status, checker: @flow_bill.checker, customer: @flow_bill.customer, note: @flow_bill.note, operate_date: @flow_bill.operate_date, operator: @flow_bill.operator, order_code: @flow_bill.order_code, purchase_code: @flow_bill.purchase_code, server_code: @flow_bill.server_code, total: @flow_bill.total }
    end

    assert_redirected_to flow_bill_path(assigns(:flow_bill))
  end

  test "should show flow_bill" do
    get :show, id: @flow_bill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flow_bill
    assert_response :success
  end

  test "should update flow_bill" do
    patch :update, id: @flow_bill, flow_bill: { account: @flow_bill.account, application_fund_id: @flow_bill.application_fund_id, bill_code: @flow_bill.bill_code, bill_date: @flow_bill.bill_date, bill_type: @flow_bill.bill_type, check_date: @flow_bill.check_date, check_status: @flow_bill.check_status, checker: @flow_bill.checker, customer: @flow_bill.customer, note: @flow_bill.note, operate_date: @flow_bill.operate_date, operator: @flow_bill.operator, order_code: @flow_bill.order_code, purchase_code: @flow_bill.purchase_code, server_code: @flow_bill.server_code, total: @flow_bill.total }
    assert_redirected_to flow_bill_path(assigns(:flow_bill))
  end

  test "should destroy flow_bill" do
    assert_difference('FlowBill.count', -1) do
      delete :destroy, id: @flow_bill
    end

    assert_redirected_to flow_bills_path
  end
end
