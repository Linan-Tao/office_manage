require 'test_helper'

class MouldCategoriesControllerTest < ActionController::TestCase
  setup do
    @mould_category = mould_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mould_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mould_category" do
    assert_difference('MouldCategory.count') do
      post :create, mould_category: { code: @mould_category.code, name: @mould_category.name }
    end

    assert_redirected_to mould_category_path(assigns(:mould_category))
  end

  test "should show mould_category" do
    get :show, id: @mould_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mould_category
    assert_response :success
  end

  test "should update mould_category" do
    patch :update, id: @mould_category, mould_category: { code: @mould_category.code, name: @mould_category.name }
    assert_redirected_to mould_category_path(assigns(:mould_category))
  end

  test "should destroy mould_category" do
    assert_difference('MouldCategory.count', -1) do
      delete :destroy, id: @mould_category
    end

    assert_redirected_to mould_categories_path
  end
end
