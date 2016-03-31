require 'test_helper'

class LogisticProvidersControllerTest < ActionController::TestCase
  setup do
    @logistic_provider = logistic_providers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:logistic_providers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create logistic_provider" do
    assert_difference('LogisticProvider.count') do
      post :create, logistic_provider: { address: @logistic_provider.address, arrival_cycle: @logistic_provider.arrival_cycle, credit_rank: @logistic_provider.credit_rank, delivery_way: @logistic_provider.delivery_way, director: @logistic_provider.director, name: @logistic_provider.name, phone: @logistic_provider.phone, price_rank: @logistic_provider.price_rank, qq: @logistic_provider.qq, secure_rank: @logistic_provider.secure_rank, serve_rank: @logistic_provider.serve_rank }
    end

    assert_redirected_to logistic_provider_path(assigns(:logistic_provider))
  end

  test "should show logistic_provider" do
    get :show, id: @logistic_provider
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @logistic_provider
    assert_response :success
  end

  test "should update logistic_provider" do
    patch :update, id: @logistic_provider, logistic_provider: { address: @logistic_provider.address, arrival_cycle: @logistic_provider.arrival_cycle, credit_rank: @logistic_provider.credit_rank, delivery_way: @logistic_provider.delivery_way, director: @logistic_provider.director, name: @logistic_provider.name, phone: @logistic_provider.phone, price_rank: @logistic_provider.price_rank, qq: @logistic_provider.qq, secure_rank: @logistic_provider.secure_rank, serve_rank: @logistic_provider.serve_rank }
    assert_redirected_to logistic_provider_path(assigns(:logistic_provider))
  end

  test "should destroy logistic_provider" do
    assert_difference('LogisticProvider.count', -1) do
      delete :destroy, id: @logistic_provider
    end

    assert_redirected_to logistic_providers_path
  end
end
