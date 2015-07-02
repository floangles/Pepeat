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
        redirect_to profile_offers_path
      else
        render :new
      end
    end
    def offer_params
       params.require(:offer).permit(:recipe_id, :startdate, :enddate, :portion)
    end
  end
end
