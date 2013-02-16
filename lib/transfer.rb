# encoding: UTF-8
require "csv"

class Transfer
  def transfer_info
    User.transaction do
      @users_changed = true
      i = 0
      CSV.foreach(Rails.root.to_s + "/users.csv", :col_sep => ";") do |row|
        i += 1
        next if i < 3
        email = row[0]
        first_name = row[1]
        last_name = row[2]
        phone = row[4]
        extra_fields = ActiveSupport::JSON.decode row[3].gsub('{', '{"').gsub(': "', '": "').gsub('", ', '", "').gsub('user', 'user"')
        user_info = extra_fields["user"]
        created_at = row[5]
        unless User.find_by_email email
          @user = User.new
          @user.email = email
          @user.first_name = first_name
          @user.last_name = last_name
          @user.phone = phone
          @user.created_at = created_at
          @user.university = user_info["Учебное заведение"]
          @user.birthday = user_info["Год рождения"] 
        end
        @users_changed &&= @user.changed?
      end
    end
  end
  def users_transfered?
    @users_changed
  end 
end
