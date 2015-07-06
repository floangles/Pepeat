module ApplicationHelper

  def day_in_french(date)

    if date.strftime('%A') == "Monday"
      day = "Lundi"
    elsif date.strftime('%A') == "Tuesday"
      day = "Mardi"
    elsif date.strftime('%A') == "Wednesday"
      day = "Mercredi"
    elsif date.strftime('%A') == "Thursday"
      day = "Jeudi"
    elsif date.strftime('%A') == "Friday"
      day = "Vendredi"
    elsif date.strftime('%A') == "Saturday"
      day = "Samedi"
    elsif  date.strftime('%A') == "Sunday"
      day = "Dimanche"
    end

  end
end
