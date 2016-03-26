require 'test_helper'

class MonthSalariesControllerTest < ActionController::TestCase
  setup do
    @month_salary = month_salaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:month_salaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create month_salary" do
    assert_difference('MonthSalary.count') do
      post :create, month_salary: { actual: @month_salary.actual, add: @month_salary.add, bonus: @month_salary.bonus, cut: @month_salary.cut, extra: @month_salary.extra, house_fund: @month_salary.house_fund, income_tax: @month_salary.income_tax, medicare_insurance: @month_salary.medicare_insurance, name: @month_salary.name, old_age_insurance: @month_salary.old_age_insurance, pre_tax: @month_salary.pre_tax, total: @month_salary.total, unemployed_insurance: @month_salary.unemployed_insurance, user_id: @month_salary.user_id }
    end

    assert_redirected_to month_salary_path(assigns(:month_salary))
  end

  test "should show month_salary" do
    get :show, id: @month_salary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @month_salary
    assert_response :success
  end

  test "should update month_salary" do
    patch :update, id: @month_salary, month_salary: { actual: @month_salary.actual, add: @month_salary.add, bonus: @month_salary.bonus, cut: @month_salary.cut, extra: @month_salary.extra, house_fund: @month_salary.house_fund, income_tax: @month_salary.income_tax, medicare_insurance: @month_salary.medicare_insurance, name: @month_salary.name, old_age_insurance: @month_salary.old_age_insurance, pre_tax: @month_salary.pre_tax, total: @month_salary.total, unemployed_insurance: @month_salary.unemployed_insurance, user_id: @month_salary.user_id }
    assert_redirected_to month_salary_path(assigns(:month_salary))
  end

  test "should destroy month_salary" do
    assert_difference('MonthSalary.count', -1) do
      delete :destroy, id: @month_salary
    end

    assert_redirected_to month_salaries_path
  end
end
