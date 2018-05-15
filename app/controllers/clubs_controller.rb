class ClubsController < ApplicationController
  def index
	if (user_signed_in? == false)
		flash[:danger] = 'Sign up or login to access of the private club !'
		redirect_to root_path
	end
  end
end
