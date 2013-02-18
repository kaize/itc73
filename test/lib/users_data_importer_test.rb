require 'test_helper'
class UsersDataImporterTest < ActiveSupport::TestCase 
  self.use_transactional_fixtures = false
  self.use_instantiated_fixtures = false

  fixtures :users_data_importer
  def setup
    way = Rails.root.to_s + "/users.csv"
    @importer = UsersDataImporter.new(way)
  end
  def making_row
    @row = users_data_importer(:user_info) 
  end

  def users_data_imported?
    true
  end
  test "should_save_users_data" do
    making_row
    @importer.prepare_fields(@row)
    @importer.saving_user!
    assert users_data_imported?
  end
end
