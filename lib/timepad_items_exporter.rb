# encoding utf-8

class TimepadItemsExporter
  def self.run(maillist_id, users)
    subscribers = []
    response = []

    users.each do |u|
      subscriber = {
        email: u.email,
        name: u.first_name,
        surname: u.last_name,
        phone: u.phone,
        comment: "#{u.university}"
      }

      subscribers << subscriber

      if subscribers.length == 10
        response << self.add_items(maillist_id, subscribers)
        subscribers = []
      end
    end

    response << self.add_items(maillist_id, subscribers)
  end

  def self.add_items(maillist_id, items)
    Timepad.maillist.add_items(maillist_id, items)
  end

end
