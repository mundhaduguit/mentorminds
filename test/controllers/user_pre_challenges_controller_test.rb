require 'test_helper'

class UserPreChallengesControllerTest < ActionController::TestCase
  setup do
    @user_pre_challenge = user_pre_challenges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_pre_challenges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_pre_challenge" do
    assert_difference('UserPreChallenge.count') do
      post :create, user_pre_challenge: { pre_challenge_id: @user_pre_challenge.pre_challenge_id, user_id: @user_pre_challenge.user_id }
    end

    assert_redirected_to user_pre_challenge_path(assigns(:user_pre_challenge))
  end

  test "should show user_pre_challenge" do
    get :show, id: @user_pre_challenge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_pre_challenge
    assert_response :success
  end

  test "should update user_pre_challenge" do
    patch :update, id: @user_pre_challenge, user_pre_challenge: { pre_challenge_id: @user_pre_challenge.pre_challenge_id, user_id: @user_pre_challenge.user_id }
    assert_redirected_to user_pre_challenge_path(assigns(:user_pre_challenge))
  end

  test "should destroy user_pre_challenge" do
    assert_difference('UserPreChallenge.count', -1) do
      delete :destroy, id: @user_pre_challenge
    end

    assert_redirected_to user_pre_challenges_path
  end
end
