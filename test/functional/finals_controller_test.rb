require 'test_helper'

class FinalsControllerTest < ActionController::TestCase
  setup do
    @final = finals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create final" do
    assert_difference('Final.count') do
      post :create, final: { score: @final.score, student_id: @final.student_id }
    end

    assert_redirected_to final_path(assigns(:final))
  end

  test "should show final" do
    get :show, id: @final
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @final
    assert_response :success
  end

  test "should update final" do
    put :update, id: @final, final: { score: @final.score, student_id: @final.student_id }
    assert_redirected_to final_path(assigns(:final))
  end

  test "should destroy final" do
    assert_difference('Final.count', -1) do
      delete :destroy, id: @final
    end

    assert_redirected_to finals_path
  end
end
