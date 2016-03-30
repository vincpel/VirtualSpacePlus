require 'test_helper'

class TutoringsControllerTest < ActionController::TestCase
  setup do
    @tutoring = tutorings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tutorings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tutoring" do
    assert_difference('Tutoring.count') do
      post :create, tutoring: { course: @tutoring.course }
    end

    assert_redirected_to tutoring_path(assigns(:tutoring))
  end

  test "should show tutoring" do
    get :show, id: @tutoring
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tutoring
    assert_response :success
  end

  test "should update tutoring" do
    patch :update, id: @tutoring, tutoring: { course: @tutoring.course }
    assert_redirected_to tutoring_path(assigns(:tutoring))
  end

  test "should destroy tutoring" do
    assert_difference('Tutoring.count', -1) do
      delete :destroy, id: @tutoring
    end

    assert_redirected_to tutorings_path
  end
end
