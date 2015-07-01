module Profile
  class BookingsController < ApplicationController
    before_action :authenticate_user!
     #si je suis un utilisateur lambda
    def index
      @bookings = current_user.bookings
    end
    def show
      @booking = current_user.bookings.find(params[:id])
    end


  end
end
