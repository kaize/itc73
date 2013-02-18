task :users_transfer => :environment do
  Transfer.new.transfer_info
end

