# encoding: UTF-8
require "csv"

class UsersDataImporter
  attr_accessor :user
  def initialize(source) 
    @source = source
  end

  def prepare_json(row)
    ActiveSupport::JSON.decode row.gsub('{', '{"').gsub(': "', '": "').gsub('", ', '", "').gsub('user', 'user"')
  end
  def prepare_fields(row)
    @email = row[0]
    @first_name = row[1]
    @last_name = row[2]
    @phone = row[4]
    extra_fields = prepare_json(row[3])
    @user_info = extra_fields["user"]
    @created_at = row[5]
    @password = row[6]
  end
  def saving_user!
    @user = User.new
    @user.id = User.last.id + 1
    @user.email = @email
    @user.first_name = @first_name
    @user.last_name = @last_name
    @user.phone = @phone
    @user.created_at = @created_at
    @user.university = @user_info["Учебное заведение"]
    @user.password = @password;
    @user.save!
  end
  def import_data
    i = 0
    CSV.foreach(@source, :col_sep => ";") do |row|
      i += 1
      next if (i < 3)
      prepare_fields(row)
      unless User.find_by_email @email
        saving_user!
      end
    end
  end
end
