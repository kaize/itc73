# encoding: UTF-8
require "csv"

class UsersDataImporter
  attr_accessor :user
  def initialize(source) 
    @source = source
  end

  def prepare_json(row)
    if row.present?
      ActiveSupport::JSON.decode row.gsub('{', '{"').gsub(': "', '": "').gsub('", ', '", "').gsub('user', 'user"')
    end
  end
  def prepare_fields(row)
    @email = row[0]
    @first_name = row[1]
    @last_name = row[2]
    @phone = row[4]
    extra_fields = prepare_json(row[3])
    if extra_fields.nil?
      @user_info = extra_fields
    else
      @user_info = extra_fields["user"]
    end
    @created_at = row[5]
    @password = row[6]
  end
  def saving_user!
    @user = User.new
    @user.email = @email
    @user.first_name = @first_name
    @user.last_name = @last_name
    @user.phone = @phone
    @user.created_at = @created_at
    if @user_info.present?
      @user.university = @user_info["Учебное заведение"]
      if @user_info["Курс"].present?
        courses = @user_info["Курс"].split(", ")
        courses.each do |course_name| 
          course = Course.find_by_name(course_name) 
          @user.courses << course if course.present? 
        end
      end
    end
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
    User.transaction do
      CSV.foreach(@source, :col_sep => ";", :headers => true) do |row|
        prepare_fields(row)
        unless User.find_by_email @email
          saving_user!
        end
      end
    end
  end
end
