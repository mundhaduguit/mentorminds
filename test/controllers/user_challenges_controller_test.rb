require 'test_helper'

class UserChallengesControllerTest < ActionController::TestCase
  setup do
    @user_challenge = user_challenges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_challenges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_challenge" do
    assert_difference('UserChallenge.count') do
      post :create, user_challenge: { challenge_id: @user_challenge.challenge_id, locked: @user_challenge.locked, marks: @user_challenge.marks, user_id: @user_challenge.user_id }
    end

    assert_redirected_to user_challenge_path(assigns(:user_challenge))
  end

  test "should show user_challenge" do
    get :show, id: @user_challenge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_challenge
    assert_response :success
  end

  test "should update user_challenge" do
    patch :update, id: @user_challenge, user_challenge: { challenge_id: @user_challenge.challenge_id, locked: @user_challenge.locked, marks: @user_challenge.marks, user_id: @user_challenge.user_id }
    assert_redirected_to user_challenge_path(assigns(:user_challenge))
  end

  test "should destroy user_challenge" do
    assert_difference('UserChallenge.count', -1) do
      delete :destroy, id: @user_challenge
    end

    assert_redirected_to user_challenges_path
  end
end
