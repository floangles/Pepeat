module Profile
  class PepeatobookingsController < ApplicationController
    before_action :authenticate_user!

#si je suis un pepeato

    def index
      @offers = current_user.offers.all
      @pepeatobookings = current_user.bookings.all
    end

    def show
      @pepeatobooking = current_user.bookings.find(params[:id])
    end
  end
end

