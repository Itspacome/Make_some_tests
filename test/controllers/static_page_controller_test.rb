require 'test_helper'

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  	include Devise::Test::IntegrationHelpers

  	def setup
  		
  	end

  	test "should go to home page" do 
    	get root_path
    	assert_response :success
    end

    test "should display a button to login and signup when you aren't connected" do 
    	get root_path
    	assert_select 'a', 'Login' 
    	assert_select 'a', 'Signup'   	
    end

    test "should display link to the club when you are connected" do
    	sign_in users(:one)
    	get root_path
    	assert_select 'a', 'Log out' 
    end

    test "navbar should display good link when you are disconnected on two different pages" do
    	get root_path
    	assert_select 'a', 'Log In' 
		assert_select 'a', 'Sign Up'
		get new_user_registration_path
		assert_select 'a', 'Log In' 
		assert_select 'a', 'Sign Up'
    end

    test "navbar should display good link when you are connected on two different pages" do
    	sign_in users(:one)
    	get root_path
    	assert_select 'a', 'Log out' 
    	assert_select 'a', 'The club'
    	get club_path
    	assert_select 'a', 'Log out' 
    	assert_select 'a', 'The club'    	 
    end
end
