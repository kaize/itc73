class AddValuesToFirmTypes < ActiveRecord::Migration
  def up
    Firm.where(:type => nil).update_all(:type => "Organizer")
  end
end
