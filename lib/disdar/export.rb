class Disdar::Export < Disdar::Resource
  # TODO read, list, delete

  RESOURCE_PATH = "/exports"

  def self.create
    body = {
      name: "awesome-export",
      fileType: "EXPORT_EXCEL"
    }.to_json
    Disdar.call_api path: RESOURCE_PATH, method: :post, body: body, headers: {"Content-Type" => "application/json"}
  end
end

