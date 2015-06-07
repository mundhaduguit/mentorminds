require 'test_helper'

class PreChallengeEventsControllerTest < ActionController::TestCase
  setup do
    @pre_challenge_event = pre_challenge_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pre_challenge_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pre_challenge_event" do
    assert_difference('PreChallengeEvent.count') do
      post :create, pre_challenge_event: { state: @pre_challenge_event.state }
    end

    assert_redirected_to pre_challenge_event_path(assigns(:pre_challenge_event))
  end

  test "should show pre_challenge_event" do
    get :show, id: @pre_challenge_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pre_challenge_event
    assert_response :success
  end

  test "should update pre_challenge_event" do
    patch :update, id: @pre_challenge_event, pre_challenge_event: { state: @pre_challenge_event.state }
    assert_redirected_to pre_challenge_event_path(assigns(:pre_challenge_event))
  end

  test "should destroy pre_challenge_event" do
    assert_difference('PreChallengeEvent.count', -1) do
      delete :destroy, id: @pre_challenge_event
    end

    assert_redirected_to pre_challenge_events_path
  end
end
