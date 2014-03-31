class Disdar::Resource < OpenStruct
  def delete
    self.class.delete self.uuid
  end
end

