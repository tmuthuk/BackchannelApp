require "test_helper"

class AuthenticationControllerTest < ActionController::TestCase
  # To change this template use File | Settings | File Templates.
  setup do
    @user = users(:userone)
    @user.password = "qaqa"
    @user.save!
  end

  test "should get sign in" do
    get :sign_in
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test "should log in" do
    post :login, user: { username: @user.username, password: "qaqa"}
    assert_not_nil session[:user_id]
    assert_redirected_to "/posts"
  end

  test "should show user" do
    post :login, user: { username: @user.username, password: "qaqa"}
    get :account_settings
    assert_response :success
  end

  test "should log out" do
    get :signed_out
    assert_nil session[:user_id]
  end


  test "should register" do
    assert_difference('User.count') do
      post :register, user: { username: "testuser", email:"testuser@test.com", password: "qaqa", password_confirmation: "qaqa"}
    end
  end


end