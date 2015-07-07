module Profile
  class PepeatcommunityController < ApplicationController
    def index
      @recipes = Recipe.all
    end
  end
end

