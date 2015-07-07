class OffersController < ApplicationController
  def index
    @recipes = Recipe.joins(:user).all
    @booking = Booking.new

    if params[:user_address]
      @users = User.near(params[:user_address])
      @recipes = []
      @users.each { |user| @recipes << user.recipes }
      @recipes = @recipes.flatten
    end

    # select * from recipes
    # inner join users on users.id = recipes.user_id
    # where users.address = "zert"
    @markers = Gmaps4rails.build_markers(@recipes) do |recipe, marker|
      marker.lat recipe.user.latitude
      marker.lng recipe.user.longitude
    end
  end

  def show
    @booking = Booking.new
    @offer = Offer.find(params[:id])
    @recipe = @offer.recipe
   # select recipes_id from recipes
   # inner join users on users.id = recipes.user_id
   # where users.id = recipes.user_id
  end
end
