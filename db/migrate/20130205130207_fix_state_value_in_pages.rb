class FixStateValueInPages < ActiveRecord::Migration
  def up
     Page.where(:state => nil).update_all(:state => "published")
  end

end
