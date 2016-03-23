class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user =  User.new(user_params)
  	@user.save
  	session[:user_id] = @user.id
  	redirect_to user_path(@user)
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def update
  raise params.inspect
  end


  def destroy
  	session.delete(:user_id)
  	redirect_to '/'
  end


  private
  def user_params
  	params.require(:user).permit(:name, :tickets, :happiness, :nausea, :height, :admin)
  end

end
