require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers

	test "should get new" do
	    get new_user_session_path
	    assert_response :success
	end

    test "valid login information" do
    	post user_session_path, params: { user: { email: "user@example.com", password: "password"}}
    	assert_redire :success
  	end

    test "invalid login information" do
    	get new_user_session_path
    	post user_session_path, params: { user: { email: "user@example.com", password: "bad_password"}}
    	assert_select 'div', 'Invalid Email or password'

  	end

  	test "authenticated users can view the club members" do 
    	sign_in users(:one)
    	get club_path
    	assert_response :success
    end

    test "authenticated users can't view the club members" do 
    	get club_path
    	assert_response :redirect
    end
end
