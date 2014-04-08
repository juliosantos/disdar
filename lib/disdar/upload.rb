class Disdar::Upload < Disdar::Resource
  def self.resource_path
    "/uploads"
  end

  def self.create(filename)
    query = {
      "file#0" => File.new( filename )
    }
    upload = Disdar.call_api path: self.resource_path, method: :post, query: query
    new upload
  end

  def documents
    documents = Disdar.call_api path: "#{self.class.resource_path}/#{self.uuid}/documents"
    documents["items"].map{ |document| new document }
  end
end

