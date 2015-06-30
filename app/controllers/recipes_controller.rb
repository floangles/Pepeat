class RecipesController < ApplicationController
  def index
    @recipes = Recipe.joins(:user).all

    if params[:city]
      @recipes = @recipes.where(users: { city: params[:city] })
    end
    # select * from recipes
    # inner join users on users.id = recipes.user_id
    # where users.address = "zert"
  end
  def show
    @recipe = Recipe.find(params[:id])
   # select recipes_id from recipes
   # inner join users on users.id = recipes.user_id
   # where users.id = recipes.user_id
  end


end
