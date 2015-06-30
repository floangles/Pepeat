module Profile
  class RecipesController < ApplicationController

    before_action :authenticate_user!
    before_action :set_recipe, only: [:show, :edit, :destroy, :update]

    def index
      @recipes = Recipe.all
    end

    def show
    end

    def create
      @recipe = current_user.recipes.new(recipe_params)
      @recipe.save
      if @recipe.save
        redirect_to profile_recipes_path
      else
        render :new
      end
    end

    def new
      @recipe = Recipe.new
    end


    def edit
    end

    def update
      @recipe.update(recipe_params)
    end

    def destroy
    end


    def set_recipe
      @recipe = current_user.recipes.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :numberpers, :description, :cooktime, :preparationtime, :price, :halal, :casher, :bio, :gluten, :lactose, :vegan, :vegetarian)
    end

  end
end
