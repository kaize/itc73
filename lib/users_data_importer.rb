# encoding: UTF-8
require "csv"

class UsersDataImporter
  attr_accessor :user
  def initialize(source) 
    @source = source
  end

  def prepare_json(row)
    unless(row == nil)
      ActiveSupport::JSON.decode row.gsub('{', '{"').gsub(': "', '": "').gsub('", ', '", "').gsub('user', 'user"')
    else
      row
    end
  end
  def prepare_fields(row)
    @email = row[0]
    @first_name = row[1]
    @last_name = row[2]
    @phone = row[4]
    extra_fields = prepare_json(row[3])
    @user_info = (extra_fields == nil) ? nil : extra_fields["user"]
    @created_at = row[5]
    @password = row[6]
  end
  def saving_user!
    @user = User.new
    @user.id = User.last.nil? ? 1 : (User.last.id + 1)
    @user.email = @email
    @user.first_name = @first_name
    @user.last_name = @last_name
    @user.phone = @phone
    @user.created_at = @created_at
    @user.university = (@user_info == nil) ? "" : @user_info["Учебное заведение"]
    @user.password_digest = @password;
    @user.activate
    @user.save!
  end
  def make_user_admin(email) 
    user = User.find_by_email email
    user.admin = true
    user.save!
  end
  def clear_database
    User.destroy_all
  end
  def import_data
    CSV.foreach(@source, :col_sep => ";", :headers => true) do |row|
      prepare_fields(row)
      unless User.find_by_email @email
        saving_user!
      end
    end
  end
end
