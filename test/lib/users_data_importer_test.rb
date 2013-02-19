# encoding: UTF-8
require 'test_helper'
class UsersDataImporterTest < ActiveSupport::TestCase 
  include ActionDispatch::TestProcess
  def setup
    path = 'users.csv'
    @file = fixture_file_upload(path)
    @importer = UsersDataImporter.new(@file)
  end
  def users_data_imported?
    i = 0;
    user_really_imported = true
    CSV.foreach(@file, :col_sep => ";") do |row|
      i += 1
      next if(i < 3)
      email = row[0]
      first_name = row[1]
      last_name = row[2]
      phone = row[4]
      extra_fields = @importer.prepare_json(row[3])
      user_info = extra_fields["user"]
      User.transaction do
        u = User.find_by_email email
        user_really_imported &&= !(u.nil?)
        if(user_really_imported) 
          user_really_imported &&= first_name == u.first_name
          user_really_imported &&= last_name == u.last_name
          user_really_imported &&= phone == u.phone
          user_really_imported &&= user_info["Учебное заведение"] == u.university
        end
      end
    end
    user_really_imported
  end
  test "should_save_users_data" do
    @importer.import_data
    assert users_data_imported?
  end
end
