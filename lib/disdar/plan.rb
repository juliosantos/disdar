class Disdar::Plan < Disdar::Resource
  def self.resource_path
    "/plans"
  end

  def self.delete(uuid)
    raise "Plans cannot be deleted"
  end

  def delete
    raise "Plans cannot be deleted"
  end
end

