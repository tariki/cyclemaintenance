module BikesHelper
  def bike_info(bike)
    "#{bike.manufacturer} #{bike.model_name} (S/N : #{bike.frame_number.blank? ? "-" : bike.frame_number})"
  end

end
