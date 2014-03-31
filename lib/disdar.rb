require "httmultiparty"
require "json"
require "ostruct"

class Disdar
  API_URL = "http://api.disdar.com"
  API_KEY = ENV["DISDAR_API_KEY"]
  raise "can't find DISDAR_API_KEY in ENV" if API_KEY.nil?

  def self.call_api(path: "/", method: :get, query: nil, body: nil, headers: nil)
    # TODO handle pagination

    path = API_URL + path
    response = HTTMultiParty.send( method, path, query: query, body: body, headers: headers, basic_auth: {username: nil, password: API_KEY} )

    JSON.parse response.body unless response.nil?
  end
end

require 'disdar/resource'

require 'disdar/callback'
require 'disdar/document'
require 'disdar/export'
require 'disdar/plan'
require 'disdar/upload'
