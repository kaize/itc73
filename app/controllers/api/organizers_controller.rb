class Api::OrganizersController < Api::ApplicationController
  def mass_update_order
    organizer_ids = params[:ids]
    organizers = Organizer.find(organizer_ids)

    organizer_ids.map!(&:to_i);

    organizers.each do |organizer|
      order = organizer_ids.index(organizer.id)
      organizer.update_attribute :order_at, order
    end

    head :ok
  end
end
