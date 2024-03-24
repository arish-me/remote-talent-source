class LocationsController < ApplicationController
   def search
    location = params[:location]
    result = Geocoder.search(location).first

    render json: result&.data&.dig('address')
  end
end
