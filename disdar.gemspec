#encoding: utf-8
Gem::Specification.new do |s|
  s.name          = "disdar"
  s.version       = "0.0.1"
  s.date          = "2014-03-31"
  s.summary       = "A RESTful consumer of Disdar's API."
  s.description   = "A RESTful consumer of Disdar's API. Callbacks, Documents, Exports, Plans, and Uploads."
  s.authors       = ["Júlio Santos"]
  s.email         = "hi@whoisjuliosantos.com"
  s.files         = ["lib/disdar.rb"]
  s.files         = ["lib/disdar.rb", "lib/disdar/resource.rb", "lib/disdar/callback.rb", "lib/disdar/document.rb", "lib/disdar/export.rb", "lib/disdar/plan.rb", "lib/disdar/upload.rb"]
  s.require_paths = ["lib"]
  s.homepage      = "http://rubygems.org/gems/disdar"
  s.license       = "MIT"

  s.add_runtime_dependency "webmock", ["= 1.17.4"]
  s.add_runtime_dependency "httmultiparty", ["= 0.3.13"]
  s.add_runtime_dependency "json", ["= 1.8.0"]
end
