class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user.address: params[:address])

  end
end
