class Disdar::Upload < Disdar::Resource
  RESOURCE_PATH = "/uploads"

  def self.create
    query = {
      "file#1" => File.new( "./invoice.pdf" )
    }
    upload = Disdar.call_api path: RESOURCE_PATH, method: :post, query: query
    new upload
  end

  def self.list
    uploads = Disdar.call_api path: RESOURCE_PATH
    uploads["items"].map{ |upload| new upload }
  end

  def self.get(uuid)
    upload = Disdar.call_api path: "#{RESOURCE_PATH}/#{uuid}"
    new upload
  end

  def self.delete(uuid)
    Disdar.call_api path: "#{RESOURCE_PATH}/#{uuid}", method: :delete
  end

  def documents
    documents = Disdar.call_api path: "#{RESOURCE_PATH}/#{self.uuid}/documents"
    documents["items"].map{ |document| new document }
  end
end

