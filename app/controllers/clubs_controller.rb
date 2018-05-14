class ClubsController < ApplicationController
  def index
	if (user_signed_in? == false)
		flash[:danger] = 'Login or signup to see our club !'
		redirect_to root_path
	end
  end
end
