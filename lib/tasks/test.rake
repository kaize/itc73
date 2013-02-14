namespace :test do
  Rails::SubTestTask.new(:lib => "test:prepare") do |t|
    t.libs << "test"
    t.pattern = 'test/lib/*_test.rb'
  end
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end
