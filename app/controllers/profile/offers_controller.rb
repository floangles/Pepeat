module Profile
  class OffersController < ApplicationController
    def index
      @offers = Offer.all
    end
    def new

      @offer = Offer.new
    end
    def create
       @offer = current_user.offers.new(offer_params)

      if @offer.save
        redirect_to profile_recipes_path
      else
        render :new
      end
    end

    def destroy
      @offer = current_user.offers.find(params[:id])
      @offer.destroy
      redirect_to profile_recipes_path
    end

    def offer_params
       params.require(:offer).permit(:recipe_id, :startdate, :enddate, :portion, :delay, :price)
    end
  end
end
