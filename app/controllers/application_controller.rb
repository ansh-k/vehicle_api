require 'open-uri'

class ApplicationController < ActionController::API

  def data_path
    File.join Rails.root, 'db'
  end

  def read_json_file filename
    JSON.parse(File.read "#{data_path}/#{filename}")
  end

  def api_call path
    api_url = "#{Rails.application.secrets.api_url}#{path}?format=json"
    Rails.cache.fetch(api_url, :expires => 3.days) do
      JSON.parse open(api_url).read
    end
  end

end
