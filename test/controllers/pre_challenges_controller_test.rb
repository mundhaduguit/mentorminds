require 'test_helper'

class PreChallengesControllerTest < ActionController::TestCase
  setup do
    @pre_challenge = pre_challenges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pre_challenges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pre_challenge" do
    assert_difference('PreChallenge.count') do
      post :create, pre_challenge: { name: @pre_challenge.name }
    end

    assert_redirected_to pre_challenge_path(assigns(:pre_challenge))
  end

  test "should show pre_challenge" do
    get :show, id: @pre_challenge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pre_challenge
    assert_response :success
  end

  test "should update pre_challenge" do
    patch :update, id: @pre_challenge, pre_challenge: { name: @pre_challenge.name }
    assert_redirected_to pre_challenge_path(assigns(:pre_challenge))
  end

  test "should destroy pre_challenge" do
    assert_difference('PreChallenge.count', -1) do
      delete :destroy, id: @pre_challenge
    end

    assert_redirected_to pre_challenges_path
  end
end
