require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/support.rb","test/test*.rb", "test/test_disdar/*.rb"]
end

desc "Run tests"
task :default => :test
