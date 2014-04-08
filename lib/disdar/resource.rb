class Disdar::Resource < OpenStruct
  def self.list
    resources = Disdar.call_api path: self.resource_path
    resources["items"].map{ |resource| new resource }
  end

  def self.get(uuid)
    resource = Disdar.call_api path: "#{self.resource_path}/#{uuid}"
    new resource
  end

  def self.delete(uuid)
    Disdar.call_api path: "#{self.resource_path}/#{uuid}", method: :delete
  end

  def delete
    self.class.delete self.uuid
  end
end

