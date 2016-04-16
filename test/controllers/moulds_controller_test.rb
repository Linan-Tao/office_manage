require 'test_helper'

class MouldsControllerTest < ActionController::TestCase
  setup do
    @mould = moulds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moulds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mould" do
    assert_difference('Mould.count') do
      post :create, mould: { code: @mould.code, name: @mould.name }
    end

    assert_redirected_to mould_path(assigns(:mould))
  end

  test "should show mould" do
    get :show, id: @mould
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mould
    assert_response :success
  end

  test "should update mould" do
    patch :update, id: @mould, mould: { code: @mould.code, name: @mould.name }
    assert_redirected_to mould_path(assigns(:mould))
  end

  test "should destroy mould" do
    assert_difference('Mould.count', -1) do
      delete :destroy, id: @mould
    end

    assert_redirected_to moulds_path
  end
end
