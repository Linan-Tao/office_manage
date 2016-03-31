require 'test_helper'

class DeliveryPlansControllerTest < ActionController::TestCase
  setup do
    @delivery_plan = delivery_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:delivery_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create delivery_plan" do
    assert_difference('DeliveryPlan.count') do
      post :create, delivery_plan: { agency_fund: @delivery_plan.agency_fund, delivery_date: @delivery_plan.delivery_date, fin_type: @delivery_plan.fin_type, logistic_code: @delivery_plan.logistic_code, logistic_provider_id: @delivery_plan.logistic_provider_id, number: @delivery_plan.number, order_id: @delivery_plan.order_id, produce_task_ids: @delivery_plan.produce_task_ids, specify_logistic: @delivery_plan.specify_logistic }
    end

    assert_redirected_to delivery_plan_path(assigns(:delivery_plan))
  end

  test "should show delivery_plan" do
    get :show, id: @delivery_plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @delivery_plan
    assert_response :success
  end

  test "should update delivery_plan" do
    patch :update, id: @delivery_plan, delivery_plan: { agency_fund: @delivery_plan.agency_fund, delivery_date: @delivery_plan.delivery_date, fin_type: @delivery_plan.fin_type, logistic_code: @delivery_plan.logistic_code, logistic_provider_id: @delivery_plan.logistic_provider_id, number: @delivery_plan.number, order_id: @delivery_plan.order_id, produce_task_ids: @delivery_plan.produce_task_ids, specify_logistic: @delivery_plan.specify_logistic }
    assert_redirected_to delivery_plan_path(assigns(:delivery_plan))
  end

  test "should destroy delivery_plan" do
    assert_difference('DeliveryPlan.count', -1) do
      delete :destroy, id: @delivery_plan
    end

    assert_redirected_to delivery_plans_path
  end
end
