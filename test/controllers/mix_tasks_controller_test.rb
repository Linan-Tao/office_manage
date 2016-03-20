require 'test_helper'

class MixTasksControllerTest < ActionController::TestCase
  setup do
    @mix_task = mix_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mix_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mix_task" do
    assert_difference('MixTask.count') do
      post :create, mix_task: { availability: @mix_task.availability, file_path: @mix_task.file_path, number: @mix_task.number }
    end

    assert_redirected_to mix_task_path(assigns(:mix_task))
  end

  test "should show mix_task" do
    get :show, id: @mix_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mix_task
    assert_response :success
  end

  test "should update mix_task" do
    patch :update, id: @mix_task, mix_task: { availability: @mix_task.availability, file_path: @mix_task.file_path, number: @mix_task.number }
    assert_redirected_to mix_task_path(assigns(:mix_task))
  end

  test "should destroy mix_task" do
    assert_difference('MixTask.count', -1) do
      delete :destroy, id: @mix_task
    end

    assert_redirected_to mix_tasks_path
  end
end
