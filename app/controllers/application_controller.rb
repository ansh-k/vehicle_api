require 'open-uri'

class ApplicationController < ActionController::API

  def data_path
    File.join Rails.root, 'db'
  end

  def read_json_file filename
    JSON.parse(File.read "#{data_path}/#{filename}")
  end

  def api_call path
    JSON.parse open("#{Rails.application.secrets.api_url}#{path}?format=json").read
  end

end
