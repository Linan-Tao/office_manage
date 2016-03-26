require 'test_helper'

class ApplicationFundsControllerTest < ActionController::TestCase
  setup do
    @application_fund = application_funds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:application_funds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create application_fund" do
    assert_difference('ApplicationFund.count') do
      post :create, application_fund: { fund_type: @application_fund.fund_type, name: @application_fund.name }
    end

    assert_redirected_to application_fund_path(assigns(:application_fund))
  end

  test "should show application_fund" do
    get :show, id: @application_fund
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @application_fund
    assert_response :success
  end

  test "should update application_fund" do
    patch :update, id: @application_fund, application_fund: { fund_type: @application_fund.fund_type, name: @application_fund.name }
    assert_redirected_to application_fund_path(assigns(:application_fund))
  end

  test "should destroy application_fund" do
    assert_difference('ApplicationFund.count', -1) do
      delete :destroy, id: @application_fund
    end

    assert_redirected_to application_funds_path
  end
end
