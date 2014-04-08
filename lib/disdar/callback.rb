class Disdar::Callback < Disdar::Resource
  def self.resource_path
    "/callbacks"
  end

  def self.create(url: nil, state: "DONE")
    body = {
      url: url,
      triggerState: state
    }.to_json
    callback = Disdar.call_api path: self.resource_path, method: :post, body: body, headers: {"Content-Type" => "application/json"}
    new callback
  end

  def self.update(uuid, url: nil, state: "DONE")
    body = {
      url: url,
      triggerState: state
    }.to_json
    Disdar.call_api path: "#{self.resource_path}/#{uuid}", method: :put, body: body, headers: {"Content-Type" => "application/json"}
  end

  def update(url: nil, state: "DONE")
    self.class.update( self.uuid, state: state )
  end
end

