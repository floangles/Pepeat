module Profile
  class RecipesController < ApplicationController

    before_action :authenticate_user!
    before_action :set_recipe, only: [:show, :edit, :destroy, :update, :like]

    def index
      @recipes = current_user.recipes
      @offer = Offer.new

    end

    def show
      @user = current_user
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
      if @recipe.save
        redirect_to profile_recipes_path
      else
        render :edit

      end
    end

    def destroy
      @recipe.destroy
      redirect_to profile_recipes_path
    end

    def like
      @recipe.rank ||= 0
      @recipe.rank += 1

      if @recipe.save
        flash[:notice] = "Miam ! Merci pour le like !"
      else
        flash[:notice] = "Une erreur est survenu !"
      end

      redirect_to profile_recipe_path(@recipe)
    end

    private

    def set_recipe
      @recipe = current_user.recipes.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:id,:name, :numberpers, :description, :cooktime, :preparationtime, :price, :halal, :casher, :bio, :gluten, :lactose, :vegan, :vegetarian, :picture, :rank)
    end

  end
end
