
class Api::VehiclesController < ApplicationController

  def all_makes
    makes = read_json_file 'getallmakes.json'
    render json: makes
  end

  def get_models_for_make
    models = api_call "/vehicles/GetModelsForMakeId/#{params[:id]}"
    render json: models    
  end

  def get_models_for_make_year
    models = api_call "/vehicles/GetModelsForMakeIdYear/makeId/#{params[:id]}/modelyear/#{params[:year]}"
    render json: models
  end

end
