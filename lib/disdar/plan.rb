class Disdar::Plan < Disdar::Resource
  RESOURCE_PATH = "/plans"

  def self.list
    plans = Disdar.call_api path: RESOURCE_PATH
    plans["items"].map{ |plan| new plan }
  end

  def self.get(uuid)
    plan = Disdar.call_api path: "#{RESOURCE_PATH}/#{uuid}"
    new plan
  end
end

