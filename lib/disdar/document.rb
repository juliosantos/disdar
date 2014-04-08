class Disdar::Document < Disdar::Resource
  def self.resource_path
    "/documents"
  end

  def results
    raise "resultUrl is nil" if self.resultUrl.nil?

    response = HTTParty.get self.resultUrl
    JSON.parse response.body unless response.nil?
  end
end

