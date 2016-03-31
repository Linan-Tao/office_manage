require 'test_helper'

class InstalersControllerTest < ActionController::TestCase
  setup do
    @instaler = instalers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instalers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instaler" do
    assert_difference('Instaler.count') do
      post :create, instaler: { credit_rank: @instaler.credit_rank, install_type: @instaler.install_type, name: @instaler.name, phone: @instaler.phone, price_rank: @instaler.price_rank, secure_rank: @instaler.secure_rank, serve_rank: @instaler.serve_rank, tech_rank: @instaler.tech_rank }
    end

    assert_redirected_to instaler_path(assigns(:instaler))
  end

  test "should show instaler" do
    get :show, id: @instaler
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instaler
    assert_response :success
  end

  test "should update instaler" do
    patch :update, id: @instaler, instaler: { credit_rank: @instaler.credit_rank, install_type: @instaler.install_type, name: @instaler.name, phone: @instaler.phone, price_rank: @instaler.price_rank, secure_rank: @instaler.secure_rank, serve_rank: @instaler.serve_rank, tech_rank: @instaler.tech_rank }
    assert_redirected_to instaler_path(assigns(:instaler))
  end

  test "should destroy instaler" do
    assert_difference('Instaler.count', -1) do
      delete :destroy, id: @instaler
    end

    assert_redirected_to instalers_path
  end
end
