require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "valid signup information" do
    assert_difference 'User.count', 1 do
    post user_registration_path, params: { user: { first_name: "first_name_exemple", 
    									                   last_name: "last_name_exemple",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    assert_redirected_to root_path
  end

  test "invalid signup form because no email" do
    assert_no_difference 'User.count' do
    post user_registration_path, params: { user: { first_name: "first_name_exemple", 
    									                   last_name: "last_name_exemple",
                                         email: "",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end 
  end

  test "invalid signup form because two emails" do
    assert_no_difference 'User.count' do
    post user_registration_path, params: { user: { first_name: "first_name_exemple", 
    									                   last_name: "last_name_exemple",
                                         email: "user@example.comuser@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end 
  end

  test "invalid signup form because miss a parameter" do
    assert_no_difference 'User.count' do
    post user_registration_path, params: { user: { first_name: "first_name_exemple", 
    									                   last_name: "",
                                         email: "user@example.comuser@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end 
  end

end
