class AttractionsController < ApplicationController
  def index
  	@user = User.find_by(id: session[:user_id])
  	@attractions = Attraction.all
  end

  def new
  	@user = User.find_by(id: session[:user_id])
  	@attraction = Attraction.new
  	redirect_to attractions_path unless @user.admin
  end

  def create
  	@attraction = Attraction.create(attraction_params)
  	redirect_to attraction_path(@attraction)
  end


  def show
  	@attraction = Attraction.find_by(id: params[:id])
  	@user =  User.find_by(id: session[:user_id])
    @ride = Ride.new
  end

  def edit
  	@attraction = Attraction.find_by(id: params[:id])
  end

  def update
  	@attraction = Attraction.find_by(id: params[:id])
  	@attraction.update(attraction_params)
  	redirect_to attraction_path(@attraction)
  end


  private
  def attraction_params
  	params.require(:attraction).permit(:name, :happiness_rating,
     :nausea_rating, :min_height, :tickets)
  end

end
