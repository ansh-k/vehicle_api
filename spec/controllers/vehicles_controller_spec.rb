require 'rails_helper'

RSpec.describe Api::VehiclesController, type: :controller do
  describe "all_makes" do
    it "get all makes" do
      get :all_makes, :format => :json
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json')
      expect(JSON.parse(response.body)["Count"]).to eq(8805)
    end
  end

  describe "get_models_for_make" do
    before(:each) do
      get :all_makes, :format => :json
      @make = JSON.parse(response.body)["Results"].first
    end

    it "get all models of make" do
      get :get_models_for_make, params: { id: @make["Make_ID"] }, :format => :json

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe "get_models_for_make_year" do
    before(:each) do
      get :all_makes, :format => :json
      @make = JSON.parse(response.body)["Results"].first
    end

    it "get all models by year 2015" do
      get :get_models_for_make_year, params: { id: @make["Make_ID"], year: 2015 }, :format => :json
      res = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json')
      expect(res["Count"]).to eq(5)
      expect(res["Results"].first["Make_ID"]).to eq(@make["Make_ID"])
    end

    it "get all models by year 2013" do
      get :get_models_for_make_year, params: { id: @make["Make_ID"], year: 2013 }, :format => :json
      res = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json')
      expect(res["Count"]).to eq(3)
      expect(res["Results"].first["Make_ID"]).to eq(@make["Make_ID"])
    end
  end
end
