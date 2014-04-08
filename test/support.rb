module TestSupport
  BASIC_AUTH = "#{nil}:#{ENV["DISDAR_API_KEY"]}"

  def api_url
    "http://#{BASIC_AUTH}@api.disdar.com"
  end
end

