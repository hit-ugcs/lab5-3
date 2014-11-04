require 'test_helper'

class DiscsControllerTest < ActionController::TestCase
  setup do
    @disc = discs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disc" do
    assert_difference('Disc.count') do
      post :create, disc: { score: @disc.score, student_id: @disc.student_id, week10: @disc.week10, week11: @disc.week11, week1: @disc.week1, week2: @disc.week2, week3: @disc.week3, week4: @disc.week4, week5: @disc.week5, week6: @disc.week6, week7: @disc.week7, week8: @disc.week8, week9: @disc.week9 }
    end

    assert_redirected_to disc_path(assigns(:disc))
  end

  test "should show disc" do
    get :show, id: @disc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disc
    assert_response :success
  end

  test "should update disc" do
    put :update, id: @disc, disc: { score: @disc.score, student_id: @disc.student_id, week10: @disc.week10, week11: @disc.week11, week1: @disc.week1, week2: @disc.week2, week3: @disc.week3, week4: @disc.week4, week5: @disc.week5, week6: @disc.week6, week7: @disc.week7, week8: @disc.week8, week9: @disc.week9 }
    assert_redirected_to disc_path(assigns(:disc))
  end

  test "should destroy disc" do
    assert_difference('Disc.count', -1) do
      delete :destroy, id: @disc
    end

    assert_redirected_to discs_path
  end
end
