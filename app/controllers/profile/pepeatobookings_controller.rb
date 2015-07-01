module Profile
  class PepeatobookingsController < ApplicationController
    before_action :authenticate_user!

#si je suis un pepeato

    def index
      @pepeatobookings = current_user.pepeatobookings.all
    end

    def show
      @pepeatobooking = current_user.pepeatobookings.find(params[:id])
    end
  end
end

