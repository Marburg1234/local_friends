class CountriesController < ApplicationController

  def regions
    country = Country.find(params[:id])
    regions = country.regions.select(:id, :name)
    render json: regions
  end

end
