require 'test_helper'

class ProjectAttacmentsControllerTest < ActionController::TestCase
  setup do
    @project_attacment = project_attacments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_attacments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_attacment" do
    assert_difference('ProjectAttacment.count') do
      post :create, project_attacment: {  }
    end

    assert_redirected_to project_attacment_path(assigns(:project_attacment))
  end

  test "should show project_attacment" do
    get :show, id: @project_attacment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_attacment
    assert_response :success
  end

  test "should update project_attacment" do
    patch :update, id: @project_attacment, project_attacment: {  }
    assert_redirected_to project_attacment_path(assigns(:project_attacment))
  end

  test "should destroy project_attacment" do
    assert_difference('ProjectAttacment.count', -1) do
      delete :destroy, id: @project_attacment
    end

    assert_redirected_to project_attacments_path
  end
end
