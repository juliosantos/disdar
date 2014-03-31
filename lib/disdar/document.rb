class Disdar::Document < Disdar::Resource
  RESOURCE_PATH = "/documents"

  def self.list
    documents = Disdar.call_api path: RESOURCE_PATH
    documents["items"].map{ |document| new document }
  end

  def self.get(uuid)
    document = Disdar.call_api path: "#{RESOURCE_PATH}/#{uuid}"
    new document
  end

  def self.delete(uuid)
    Disdar.call_api path: "#{RESOURCE_PATH}/#{uuid}", method: :delete
  end

  def results
    raise "resultUrl is nil" if self.resultUrl.nil?

    response = HTTParty.get self.resultUrl
    JSON.parse response.body unless response.nil?
  end
end

