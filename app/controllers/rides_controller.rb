class RidesController < ApplicationController
  def create
  	@ride = Ride.create(ride_params)
  	@user = User.find_by(id: session[:user_id])
  	error = @ride.take_ride
  	redirect_to user_path(@user), 
  	notice: @ride.executed ?  "Thanks for riding the #{@ride.attraction.name}!": error    	
  end


  private
  def ride_params
  	params.require(:ride).permit(:user_id, :attraction_id)
  end
end
