class Disdar::Export < Disdar::Resource
  # TODO read, list, delete

  def self.resource_path
    "/exports"
  end

  def self.create_json(name)
    self.create( name: name, filetype: "EXPORT_JSON" )
  end

  def self.create_excel(name)
    self.create( name: name, filetype: "EXPORT_EXCEL" )
  end

  def self.create(name: "export", filetype: "EXPORT_JSON")
    body = {
      name: name,
      fileType: filetype
    }.to_json
    Disdar.call_api path: self.resource_path, method: :post, body: body, headers: {"Content-Type" => "application/json"}
  end
end

