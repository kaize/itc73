task :users_destroy_and_import => :environment do
  importer = UsersDataImporter.new("#{Rails.root}/users.csv")
  importer.clear_database
  importer.import_data
  importer.make_user_admin("admin@np.kaize.ru")
end

