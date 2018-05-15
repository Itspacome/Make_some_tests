require 'test_helper'

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  	include Devise::Test::IntegrationHelpers

  	def setup
  		
  	end

  	test "should get home" do 
    	get root_path
    	assert_response :success
    end

    test "should display login & signup button when you're not connected" do 
    	get root_path
    	assert_select 'a', 'Login' 
    	assert_select 'a', 'Signup'   	
    end

    test "should display link to the club when you're not connected" do
    	sign_in users(:one)
    	get root_path
    	assert_select 'a', 'Log out' 
    end

    test "should display good link in navbar when you're disconnected on two different pages" do
    	get root_path
    	assert_select 'a', 'Log In' 
		assert_select 'a', 'Sign Up'
		get new_user_registration_path
		assert_select 'a', 'Log In' 
		assert_select 'a', 'Sign Up'
    end

    test "should display good link in navbar when you're connected on two different pages" do
    	sign_in users(:one)
    	get root_path
    	assert_select 'a', 'Log out' 
    	assert_select 'a', 'The club'
    	get club_path
    	assert_select 'a', 'Log out' 
    	assert_select 'a', 'The club'    	 
    end
end
