class TimepadMaillistsImporter
  def self.run
    lists = Timepad.maillist.get_list

    TimepadMaillist.destroy_all

    lists.each do |l|
      TimepadMaillist.create(name: l['name'], items_count: l['itemsCount'], original_id: l['id'])
    end
  end

end
