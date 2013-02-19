task :users_import => :environment do
  UsersDataImporter.new("#{Rails.root}/test/fixtures/users.csv").import_data
end

