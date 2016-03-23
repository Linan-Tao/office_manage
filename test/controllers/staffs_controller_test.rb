require 'test_helper'

class StaffsControllerTest < ActionController::TestCase
  setup do
    @staff = staffs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:staffs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create staff" do
    assert_difference('Staff.count') do
      post :create, staff: { base_salary: @staff.base_salary, department_id: @staff.department_id, house_fund: @staff.house_fund, id_card: @staff.id_card, medicare_insurance: @staff.medicare_insurance, name: @staff.name, old_age_insurance: @staff.old_age_insurance, status: @staff.status, unemployed_insurance: @staff.unemployed_insurance, user_id: @staff.user_id }
    end

    assert_redirected_to staff_path(assigns(:staff))
  end

  test "should show staff" do
    get :show, id: @staff
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @staff
    assert_response :success
  end

  test "should update staff" do
    patch :update, id: @staff, staff: { base_salary: @staff.base_salary, department_id: @staff.department_id, house_fund: @staff.house_fund, id_card: @staff.id_card, medicare_insurance: @staff.medicare_insurance, name: @staff.name, old_age_insurance: @staff.old_age_insurance, status: @staff.status, unemployed_insurance: @staff.unemployed_insurance, user_id: @staff.user_id }
    assert_redirected_to staff_path(assigns(:staff))
  end

  test "should destroy staff" do
    assert_difference('Staff.count', -1) do
      delete :destroy, id: @staff
    end

    assert_redirected_to staffs_path
  end
end
