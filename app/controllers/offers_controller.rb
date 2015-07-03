class OffersController < ApplicationController
  def index
    @recipes = Recipe.joins(:user).all
    @offers = Offer.joins(@recipes)


      if params[:city]
        @recipes = Recipe.joins(:user).where(users: { city: params[:city] })
      end
      # # select * from recipes
    # inner join users on users.id = recipes.user_id
    # where users.address = "zert"
  end
  def show
    @offers = Recipe.find(params[:id])
    @user_coordinates = { lat: current_user.lat, lng: current_user.lng }
   # select recipes_id from recipes
   # inner join users on users.id = recipes.user_id
   # where users.id = recipes.user_id
  end


end
