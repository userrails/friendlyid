class RestaurantsController < ApplicationController
   def index
     @restaurants = Restaurant.all
   end

   def new
     @restaurant = Restaurant.new
   end

   def create
     @restaurant = Restaurant.new(restaurant_params)
     if @restaurant.save
       redirect_to homes_path
     else
      render :action => "new"
     end
   end

  def show
    @restaurant = Restaurant.friendly.find(params[:id])
  end

   private
   def restaurant_params
      params.require(:restaurant).permit!
   end
end
