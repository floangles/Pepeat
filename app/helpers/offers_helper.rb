module OffersHelper
  def available_portions(offer)
    offer.portion - booked_portions(offer)
  end

  def booked_portions(offer)
    offer.bookings.sum(:quantity)
  end
end
