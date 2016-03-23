class SessionsController < ApplicationController
  
  def new
  	@users = User.all 
  end

  def create
  	#raise params.inspect

  	session[:user_id] = user_params[:id]
  	redirect_to user_path(user_params[:id])
  end

  private
  def user_params
  	params.require(:user).permit(:id)
  end
  
  
#potential helper -  any available users? login_in? current_user? 
end
