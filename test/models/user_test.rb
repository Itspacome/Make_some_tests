require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "first_name3", last_name: "last_name3", email: "user3@example.com" , password: "password", password_confirmation: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "first_name should be present" do
	@user.first_name =""
	assert_not @user.valid?
  end  

  test "first_name shouldn't be only spaces" do
	@user.first_name ="       "
	assert_not @user.valid?
  end  

  test "last_name should be present" do
	@user.last_name =""
	assert_not @user.valid?
  end  

  test "last_name shouldn't be only spaces" do
	@user.last_name ="       "
	assert_not @user.valid?
  end  

  test "email should be unique" do
  	# Pour rappel, users.yml représente la database avant chaque test. Celle-ci contient déjà un user avec user1@example.com
    @user.email = "user1@example.com"
    assert_not @user.valid?
  end
  
end
