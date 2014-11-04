require 'test_helper'

class AttensControllerTest < ActionController::TestCase
  setup do
    @atten = attens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atten" do
    assert_difference('Atten.count') do
      post :create, atten: { score: @atten.score, student_id: @atten.student_id, week10: @atten.week10, week11: @atten.week11, week1: @atten.week1, week2: @atten.week2, week3: @atten.week3, week4: @atten.week4, week5: @atten.week5, week6: @atten.week6, week7: @atten.week7, week8: @atten.week8, week9: @atten.week9 }
    end

    assert_redirected_to atten_path(assigns(:atten))
  end

  test "should show atten" do
    get :show, id: @atten
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atten
    assert_response :success
  end

  test "should update atten" do
    put :update, id: @atten, atten: { score: @atten.score, student_id: @atten.student_id, week10: @atten.week10, week11: @atten.week11, week1: @atten.week1, week2: @atten.week2, week3: @atten.week3, week4: @atten.week4, week5: @atten.week5, week6: @atten.week6, week7: @atten.week7, week8: @atten.week8, week9: @atten.week9 }
    assert_redirected_to atten_path(assigns(:atten))
  end

  test "should destroy atten" do
    assert_difference('Atten.count', -1) do
      delete :destroy, id: @atten
    end

    assert_redirected_to attens_path
  end
end
